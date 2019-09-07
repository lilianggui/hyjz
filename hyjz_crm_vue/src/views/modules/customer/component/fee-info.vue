<template>
  <div class="table" style="width: 1220px">
    <el-form>
      <el-form-item >
        <el-button v-if="!isShowAll" size="mini" @click="showAll" class="btn-right">查询全部</el-button>
        <el-button size="mini" type="primary" @click="addRow()" class="btn-right">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="feeInfoList" ref="table" >
      <el-table-column width="200" label="日期">
        <template slot-scope="scope">
          <el-date-picker type="date" v-model="scope.row.feeDate" @change="validate(scope.row, 'feeDate')"
                          value-format="yyyy-MM-dd HH:mm:ss" :disabled="!rowUpdating(scope.row)"></el-date-picker>
        </template>
      </el-table-column>
      <el-table-column width="220" label="交易金额（万元）" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.tradeAmount" @blur="validate(scope.row, 'tradeAmount')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="结算市值（万元）" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.closeMarketValue" @blur="validate(scope.row, 'closeMarketValue')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="200" prop="name" label="备注" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.remark" @blur="validate(scope.row, 'remark')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="录入人" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.entryPerson" @blur="validate(scope.row, 'entryPerson')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="160"  label="操作">
        <template slot-scope="scope">
          <el-button v-if="!rowUpdating(scope.row)" size="mini" @click="scope.row.updating=true">修改</el-button>
          <el-button v-if="rowUpdating(scope.row)" size="mini" @click="saveOrUpdate(scope.row)">保存</el-button>
          <el-button size="mini" type="danger" @click="deleteHandle(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="block" v-if="isShowAll">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[10, 20, 30, 50]"
        :page-size="20"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  import { isEmpty, commonName, commonMoney } from '@/utils/validate'
  export default {
    name: 'fee-info',
    data () {
      return {
        feeInfoList: [],
        total: 0,
        custId: 0,
        limit: 5,
        currentPage: 1,
        isShowAll: false
      }
    },
    activated () {
      let routerQuery = this.$route.query
      this.custId = routerQuery.custId
      this.isShowAll = routerQuery.isShowAll
      if (this.isShowAll) {
        this.limit = 20
      }
      this.getDataList()
    },
    methods: {
      handleSizeChange (val) {
        this.currentPage = 1
        this.limit = val
        this.getDataList()
      },
      handleCurrentChange (val) {
        this.currentPage = val
        this.getDataList()
      },
      saveOrUpdate (row) {
        if (this.validate(row) === '') {
          // 验证通过
          let that = this
          let url = '/feeInfo/save'
          if (row.feeId) {
            url = '/feeInfo/update'
          }
          this.$http({
            url: this.$http.adornUrl(url),
            method: 'post',
            data: this.$http.adornData(row)
          }).then(({data}) => {
            if (data && data.code === 0) {
              that.getDataList()
              that.$message.success('保存成功')
            } else {
              that.$message.error(data.msg)
            }
          })
        }
      },
      validate (row, field) {
        let errorMsg = ''
        if (!field || field === 'feeDate') {
          if (isEmpty(row.feeDate)) {
            errorMsg = '日期不能为空！'
          }
        }
        if ((!field || field === 'tradeAmount') && !errorMsg) {
          if (isEmpty(row.tradeAmount + '')) {
            errorMsg = '交易金额不能为空！'
          } else if (!commonMoney(row.tradeAmount + '')) {
            errorMsg = '交易金额必须为数字，可输入两位小数！'
          }
        }
        if ((!field || field === 'closeMarketValue') && !errorMsg) {
          if (isEmpty(row.closeMarketValue + '')) {
            errorMsg = '结算市值不能为空！'
          } else if (!commonMoney(row.closeMarketValue + '')) {
            errorMsg = '结算市值必须为数字，可输入两位小数！'
          }
        }
        if ((!field || field === 'entryPerson') && !errorMsg) {
          if (isEmpty(row.entryPerson)) {
            errorMsg = '录入人不能为空！'
          } else if (!commonName(row.entryPerson)) {
            errorMsg = '录入人不能有特殊字符，最长32个字符！'
          }
        }
        if ((!field || field === 'remark') && !errorMsg) {
          if (row.remark && row.remark.length > 512) {
            errorMsg = '备注最长512个字符！'
          }
        }
        if (errorMsg) {
          this.$message.error(errorMsg)
        }
        return errorMsg
      },
      rowUpdating (row) {
        if (row.updating === undefined) {
          this.$set(row, 'updating', false)
        }
        return row.updating
      },
      showAll () {
        this.$router.push({name: 'all-fee-info', query: {name: 1 + '', title: '', custId: this.custId, isShowAll: true}})
      },
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/feeInfo/list'),
          method: 'get',
          params: this.$http.adornParams({ 'limit': this.limit, page: this.currentPage })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.feeInfoList = data.page.list
            this.total = data.page.totalCount
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      deleteHandle (index, row) {
        if (!row.feeId) {
          this.feeInfoList.splice(index, 1)
          return false
        }
        this.$confirm('确定删除么?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/feeInfo/delete?feeId=' + row.feeId),
            method: 'post'
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.getDataList()
              this.$message({ type: 'success', message: '删除成功!' })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      },
      addRow () {
        this.feeInfoList.unshift({
          feeId: 0,
          rowNum: '',
          feeDate: '',
          tradeAmount: '',
          closeMarketValue: '',
          entryPerson: '',
          updating: true,
          remark: ''
        })
      }
    }
  }
</script>

<style>
  .btn-right{
    float: right;margin: 0 10px 0 10px;
  }
  .table-column{
    width: 50px;
  }
</style>
