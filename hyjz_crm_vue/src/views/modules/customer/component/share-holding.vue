<!--持股情况-->
<template>
  <div class="table" style="width: 1140px">
    <el-form>
      <el-form-item >
        <el-button v-if="!isShowAll" size="mini" @click="showAll" class="btn-right">查询全部</el-button>
        <el-button size="mini" type="primary" @click="addRow()" class="btn-right">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="shareHoldingList">
      <el-table-column width="200" label="股票代码">
        <template slot-scope="scope">
          <el-input v-model="scope.row.stockCode" @blur="validate(scope.row, 'stockCode')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="股票名称" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.stockName" @blur="validate(scope.row, 'stockName')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="股票数量" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.stockCount" @blur="validate(scope.row, 'stockCount')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="200" prop="name" label="持股成本" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.shareHoldingCost" @blur="validate(scope.row, 'shareHoldingCost')" :disabled="!rowUpdating(scope.row)"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="300"  label="操作">
        <template slot-scope="scope">
          <el-button v-if="rowUpdating(scope.row)" size="mini" @click="save(scope.row)">保存</el-button>
          <el-button size="mini" type="danger" @click="deleteHandle(scope.$index, scope.row)">删除</el-button>
          <el-button v-if="!scope.row.isNew" size="mini" type="danger" @click="deleteHandle(scope.row.custId)">买入/卖出</el-button>
          <el-button v-if="!scope.row.isNew" size="mini" type="danger" @click="deleteHandle(scope.row.custId)">历史交易记录</el-button>
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
  import { commonName, commonMoney, doValidate } from '@/utils/validate'
  export default {
    name: 'share-holding',
    data () {
      return {
        shareHoldingList: [],
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
          let url = '/shareHolding/save'
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
          stockCode: [
            {required: true, message: '股票代码不能为空'},
            {pattern: '^[0-9]{6}$', message: '股票代码格式不正确'}
          ],
          stockName: [
            {required: true, message: '股票名称不能为空'},
            {validator: function (s) { return commonName(s, 1, 16) }, message: '股票名称不能有特殊字符，最多16字符'}
          ],
          stockCount: [
            {required: true, message: '股票数量不能为空'},
            {pattern: '^[0-9]*$', message: '股票数量必须为正整数'},
            {validator: function (s) { return s.length < 10 }, message: '股票数量太大了'}
          ],
          shareHoldingCost: [
            {required: true, message: '持股成本不能为空'},
            {validator: commonMoney, message: '持股成本必须位数字，可有两位小数'}
          ]
        }
        let errorMsg = doValidate(rules, row, field)
        if (errorMsg) {
          this.$message.error(errorMsg)
        }
        return errorMsg
      },
      showAll () {
        this.$router.push({name: 'all-share-holding', query: {name: 1 + '', title: '', custId: this.custId, isShowAll: true}})
      },
      rowUpdating (row) {
        if (row.updating === undefined) {
          this.$set(row, 'updating', false)
        }
        return row.updating
      },
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/shareHolding/list'),
          method: 'get',
          params: this.$http.adornParams({ 'limit': this.limit, page: this.currentPage, custId: this.custId })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.shareHoldingList = data.page.list
            this.total = data.page.totalCount
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      addRow () {
        this.shareHoldingList.unshift({
          shareHoldingId: 0,
          custId: this.custId,
          stockCode: '',
          stockName: '',
          stockCount: '',
          updating: true,
          isNew: true,
          shareHoldingCost: ''
        })
      },
      deleteHandle (index, row) {
        if (!row.shareHoldingId) {
          this.shareHoldingList.splice(index, 1)
          return false
        }
        this.$confirm('确定删除么?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/shareHolding/delete?shareHoldingId=' + row.shareHoldingId),
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
