<!--资金流水-->
<template>
  <div class="table" style="width: 1000px">
    <el-form>
      <el-form-item >
        <el-button v-if="!isShowAll" size="mini" @click="showAll" class="btn-right">查询全部</el-button>
        <el-button size="mini" type="primary" @click="addRow()" class="btn-right">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="capitalFlowList" ref="table" >
      <el-table-column width="200" label="日期">
        <template slot-scope="scope">
          <el-date-picker type="date" v-model="scope.row.flowDate" @change="validate(scope.row, 'flowDate')"
                          value-format="yyyy-MM-dd HH:mm:ss" :disabled="!rowUpdating(scope.row)"></el-date-picker>
        </template>
      </el-table-column>
      <el-table-column width="220" label="流入/流出（万元）" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.inOrOut" @blur="validate(scope.row, 'inOrOut')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="备注" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.remark" @blur="validate(scope.row, 'remark')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="200" prop="name" label="录入人" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.entryPerson" @blur="validate(scope.row, 'entryPerson')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>

      <el-table-column width="160"  label="操作">
        <template slot-scope="scope">
          <el-button v-if="rowUpdating(scope.row)" size="mini" @click="save(scope.row)">保存</el-button>
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
  import { isEmpty, commonName, floatNumber } from '@/utils/validate'
  export default {
    name: 'capital-flow',
    data () {
      return {
        capitalFlowList: [],
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
      save (row) {
        if (this.validate(row) === '') {
          // 验证通过
          let that = this
          let url = '/capitalFlow/save'
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
        if (!field || field === 'flowDate') {
          if (isEmpty(row.flowDate)) {
            errorMsg = '日期不能为空！'
          }
        }
        if ((!field || field === 'inOrOut') && !errorMsg) {
          if (isEmpty(row.inOrOut + '')) {
            errorMsg = '流入/流出不能为空！'
          } else if (!floatNumber(row.inOrOut + '')) {
            errorMsg = '流入/流出必须为数字，可输入两位小数！'
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
        this.$router.push({name: 'all-capital-flow', query: {name: 1 + '', title: '', custId: this.custId, isShowAll: true}})
      },
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/capitalFlow/list'),
          method: 'get',
          params: this.$http.adornParams({ 'limit': this.limit, page: this.currentPage, custId: this.custId })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.capitalFlowList = data.page.list
            this.total = data.page.totalCount
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      addRow () {
        this.capitalFlowList.unshift({
          capitalFlowId: 0,
          custId: this.custId,
          flowDate: this.address,
          inOrOut: this.name,
          entryPerson: this.weather,
          remark: this.phone,
          updating: true
        })
      },
      deleteHandle (index, row) {
        if (!row.capitalFlowId) {
          this.feeInfoList.splice(index, 1)
          return false
        }
        this.$confirm('确定删除么?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/capitalFlow/delete?capitalFlowId=' + row.capitalFlowId),
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
