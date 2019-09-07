<!--回访记录-->
<template>
  <div class="table" style="width: 900px">
    <el-form>
      <el-form-item >
        <el-button size="mini" type="primary" @click="addRow()" class="btn-right">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="returnVisitList" ref="table" >
      <el-table-column width="200" label="回访记录日期">
        <template slot-scope="scope">
          <el-date-picker type="date" v-model="scope.row.visitDate" @change="validate(scope.row, 'visitDate')"
                          value-format="yyyy-MM-dd HH:mm:ss" :disabled="!scope.row.isNew"></el-date-picker>
        </template>
      </el-table-column>
      <el-table-column width="300" label="回访记录内容" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.content" @blur="validate(scope.row, 'content')" :disabled="!scope.row.isNew"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="录入人" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.entryPerson" @blur="validate(scope.row, 'entryPerson')" :disabled="!scope.row.isNew"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="150" label="操作" align="center">
        <template slot-scope="scope">
          <el-button v-if="scope.row.isNew" size="mini" @click="save(scope.row)">保存</el-button>
          <el-button size="mini" type="danger" @click="deleteHandle(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  import { commonName, doValidate } from '@/utils/validate'
  export default {
    name: 'return-visit',
    data () {
      return {
        returnVisitList: [],
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
      save (row) {
        if (this.validate(row) === '') {
          // 验证通过
          let that = this
          let url = '/returnVisit/save'
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
        let rules = {
          visitDate: [
            {required: true, message: '回访记录日期不能为空'}
          ],
          content: [
            {required: true, message: '回访记录内容不能为空'},
            {validator: function (s) { return s.length < 512 }, message: '回访记录内容不得超过512字符'}
          ],
          entryPerson: [
            {required: true, message: '录入人不能为空'},
            {validator: commonName, message: '录入人不能有特殊字符，长度不得超过32字符'}
          ]
        }
        let errorMsg = doValidate(rules, row, field)
        if (errorMsg) {
          this.$message.error(errorMsg)
        }
        return errorMsg
      },
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/returnVisit/list'),
          method: 'get',
          params: this.$http.adornParams({ 'limit': this.limit, page: this.currentPage, custId: this.custId })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.returnVisitList = data.page.list
            this.total = data.page.totalCount
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      deleteHandle (index, row) {
        if (!row.returnVisitId) {
          this.returnVisitList.splice(index, 1)
          return false
        }
        this.$confirm('确定删除么?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/returnVisit/delete?returnVisitId=' + row.returnVisitId),
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
        this.returnVisitList.unshift({
          returnVisitId: 0,
          custId: this.custId,
          visitDate: '',
          content: '',
          isNew: true,
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
