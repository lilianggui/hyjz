<!--市值统计-->
<template>
  <div class="table" style="width: 1220px">
    <el-form>
      <el-form-item >
        <el-button v-if="!isShowAll" size="mini" @click="showAll" class="btn-right">查询全部</el-button>
        <el-button size="mini" type="primary" @click="addRow()" class="btn-right">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="marketValueList" ref="table" >
      <el-table-column width="200" label="日期">
        <template slot-scope="scope">
          <el-date-picker type="date" v-model="scope.row.marketValueDate" @change="validate(scope.row, 'marketValueDate')"
                          value-format="yyyy-MM-dd HH:mm:ss" :disabled="!rowUpdating(scope.row)"></el-date-picker>
        </template>
      </el-table-column>
      <el-table-column width="220" label="市值" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.marketValue" :disabled="!rowUpdating(scope.row)" @blur="validate(scope.row, 'marketValue')"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="增减" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.increaseReduce" :disabled="true"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="200" prop="name" label="增幅" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.increase" :disabled="true"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="录入人">
        <template slot-scope="scope">
          <el-input v-model="scope.row.entryPerson" @blur="validate(scope.row, 'entryPerson')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="160" label="操作" align="center">
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
    name: 'market-value',
    data () {
      return {
        marketValueList: [],
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
          let url = '/marketValue/save'
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
        if (!field || field === 'marketValueDate') {
          if (isEmpty(row.marketValueDate)) {
            errorMsg = '日期不能为空！'
          }
        }
        if ((!field || field === 'marketValue') && !errorMsg) {
          if (isEmpty(row.marketValue + '')) {
            errorMsg = '市值不能为空！'
          } else if (!floatNumber(row.marketValue + '')) {
            errorMsg = '市值必须为数字，可输入两位小数！'
          }
        }
        if ((!field || field === 'entryPerson') && !errorMsg) {
          if (isEmpty(row.entryPerson)) {
            errorMsg = '录入人不能为空！'
          } else if (!commonName(row.entryPerson)) {
            errorMsg = '录入人不能有特殊字符，最长32个字符！'
          }
        }
        if (errorMsg) {
          this.$message.error(errorMsg)
        }
        return errorMsg
      },
      showAll () {
        this.$router.push({name: 'all-market_value', query: {name: 1 + '', title: '', custId: this.custId, isShowAll: true}})
      },
      rowUpdating (row) {
        if (row.updating === undefined) {
          this.$set(row, 'updating', false)
        }
        return row.updating
      },
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/marketValue/list'),
          method: 'get',
          params: this.$http.adornParams({ 'limit': this.limit, page: this.currentPage, custId: this.custId })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.marketValueList = data.page.list
            this.total = data.page.totalCount
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      deleteHandle (index, row) {
        if (!row.marketValueId) {
          this.marketValueList.splice(index, 1)
          return false
        }
        this.$confirm('确定删除么?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/marketValue/delete?marketValueId=' + row.marketValueId),
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
        this.marketValueList.unshift({
          custId: this.custId,
          marketValueId: 0,
          marketValueDate: '',
          marketValue: '',
          increase: '',
          increaseReduce: '',
          updating: true,
          entryPerson: ''
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
