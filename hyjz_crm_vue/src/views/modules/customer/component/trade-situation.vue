<!--交易情况-->
<template>
  <div class="table" style="width: 800px">
    <el-table :data="tradeSituationList" ref="table" >
      <el-table-column width="200" label="股票代码">
        <template slot-scope="scope">
          <el-input v-model="scope.row.stockCode" :disabled="true"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="股票名称" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.stockName" :disabled="true"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="220" label="盈亏" >
        <template slot-scope="scope">
          <el-input v-model="scope.row.profitAndLoss" :disabled="true"></el-input>
        </template>
      </el-table-column>
      <el-table-column width="130"  label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="addOrUpdateHandle(scope.row.custId)">查看记录</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  export default {
    name: 'trade-situation',
    data () {
      return {
        tradeSituationList: [],
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
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/tradeSituation/list'),
          method: 'get',
          params: this.$http.adornParams({ 'limit': this.limit, page: this.currentPage, custId: this.custId })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.tradeSituationList = data.page.list
            this.total = data.page.totalCount
          } else {
            this.$message.error(data.msg)
          }
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
