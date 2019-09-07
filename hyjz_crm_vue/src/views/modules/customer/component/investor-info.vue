<template>
  <div class="table" style="width: 1400px">
    <el-form>
      <el-form-item >
        <el-button v-if="!this.isShowAll" size="mini" @click="showAll" class="btn-right">查询全部</el-button>
        <el-button size="mini" type="primary" @click="addRow()" class="btn-right">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="investorList" ref="table" >
      <el-table-column width="200" label="名称">
        <template slot-scope="scope">
          <el-input @blur="validate(scope.row, 'investorName')" v-model="scope.row.investorName" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="日期" >
        <template slot-scope="scope">
          <el-date-picker @change="validate(scope.row, 'investDate')" type="date" v-model="scope.row.investDate" value-format="yyyy-MM-dd HH:mm:ss" :disabled="!rowUpdating(scope.row)"></el-date-picker>
        </template>
      </el-table-column>
      <el-table-column width="220" label="投资额（万元）" >
        <template slot-scope="scope">
          <el-input @blur="validate(scope.row, 'investAmount')" v-model="scope.row.investAmount" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="200" prop="name" label="开发人" >
        <template slot-scope="scope">
          <el-input @blur="validate(scope.row, 'developer')" v-model="scope.row.developer" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="备注" >
        <template slot-scope="scope">
          <el-input @keyup.enter.native="saveOrUpdateInvestor(scope.row)" @blur="validate(scope.row, 'remark')" v-model="scope.row.remark" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="320"  label="操作">
        <template slot-scope="scope">
          <el-button v-if="!rowUpdating(scope.row)" size="mini" @click="scope.row.updating=true">修改</el-button>
          <el-button v-if="rowUpdating(scope.row)" size="mini" @click="saveOrUpdateInvestor(scope.row)">保存</el-button>
          <el-button size="mini" type="danger" @click="deleteHandle(scope.$index, scope.row)">删除</el-button>
          <el-button size="mini" type="danger" @click="deleteHandle(scope.row.custId)">移除</el-button>
          <el-button size="mini" type="danger" @click="deleteHandle(scope.row.custId)">变更记录</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  import { isEmpty, commonName, commonMoney } from '@/utils/validate'
  export default {
    name: 'investor-info',
    data () {
      return {
        investorList: [],
        custId: 0,
        isShowAll: false,
        limit: 5
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
      showAll () {
        this.$router.push({name: 'all-investor', query: {name: 1 + '', title: '', custId: this.custId, isShowAll: true}})
      },
      saveOrUpdateInvestor (row) {
        if (this.validate(row) === '') {
          // 验证通过
          let that = this
          let url = '/investor/save'
          if (row.investorId) {
            url = '/investor/update'
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
        if (!field || field === 'investorName') {
          if (isEmpty(row.investorName)) {
            errorMsg = '投资者名称不能为空！'
          } else if (!commonName(row.investorName)) {
            errorMsg = '投资者名称不能有特殊字符，最长32个字符！'
          }
        }
        if ((!field || field === 'investDate') && !errorMsg) {
          if (isEmpty(row.investDate)) {
            errorMsg = '日期不能为空！'
          }
        }
        if ((!field || field === 'investAmount') && !errorMsg) {
          if (isEmpty(row.investAmount + '')) {
            errorMsg = '投资额不能为空！'
          } else if (!commonMoney(row.investAmount + '')) {
            errorMsg = '必须为数字，可输入两位小数！'
          }
        }
        if ((!field || field === 'developer') && !errorMsg) {
          if (isEmpty(row.developer)) {
            errorMsg = '开发人不能为空！'
          } else if (!commonName(row.developer)) {
            errorMsg = '开发人不能有特殊字符，最长32个字符！'
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
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/investor/list'),
          method: 'get',
          params: this.$http.adornParams({ 'limit': this.limit })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.investorList = data.page.list
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      rowUpdating (row) {
        if (row.updating === undefined) {
          this.$set(row, 'updating', false)
        }
        return row.updating
      },
      addRow () {
        this.investorList.unshift({
          investorId: '',
          updating: true,
          investorName: '',
          investDate: '',
          investAmount: '',
          developer: '',
          remark: ''
        })
      },
      deleteHandle (index, row) {
        if (!row.investorId) {
          this.investorList.splice(index, 1)
          return false
        }
        this.$confirm('确定删除么?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/investor/delete?investorId=' + row.investorId),
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
</style>
