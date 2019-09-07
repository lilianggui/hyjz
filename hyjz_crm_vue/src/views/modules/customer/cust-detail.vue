<template>
  <div>
    <div class="detail-module" id="base-info">
      <h3>基本信息</h3>
      <base-info></base-info>
    </div>
    <div class="detail-module" id="investor-info">
      <h3>投资者信息</h3>
      <investor-info></investor-info>
    </div>
    <div class="detail-module" id="fee-info">
      <h3>交费情况</h3>
      <fee-info></fee-info>
    </div>
    <div class="detail-module" id="capital-flow">
      <h3>资金流水</h3>
      <capital-flow></capital-flow>
    </div>
    <div class="detail-module" id="market-value">
      <h3>市值统计</h3>
      <market-value></market-value>
    </div>
    <div class="detail-module" id="share-holding">
      <h3>持股情况</h3>
      <share-holding></share-holding>
    </div>
    <div class="detail-module" id="trade-situation">
      <h3>交易情况</h3>
      <trade-situation></trade-situation>
    </div>
    <div class="detail-module" id="return-visit">
      <h3>回访记录</h3>
      <return-visit></return-visit>
    </div>
    <!--<div v-for="item in moduleNav" class="detail-module" :id="item.id">-->
      <!--<h3>{{ item.text }}</h3>-->
      <!--<base-info v-if="item.id === 'base-info'"></base-info>-->
      <!--<investor-info v-if="item.id === 'investor-info'"></investor-info>-->
      <!--<fee-info v-if="item.id === 'fee-info'"></fee-info>-->
      <!--<capital-flow v-if="item.id === 'capital-flow'"></capital-flow>-->
      <!--<market-value v-if="item.id === 'market-value'"></market-value>-->
      <!--<share-holding v-if="item.id === 'share-holding'"></share-holding>-->
      <!--<trade-situation v-if="item.id === 'trade-situation'"></trade-situation>-->
      <!--<return-visit v-if="item.id === 'return-visit'"></return-visit>-->
    <!--</div>-->
    <div id="nav-div">
      <p v-for="item in moduleNav" :id="item.id + '-p'" @click="goTo(item.id)" class="nav-p">{{ item.text }}</p>
    </div>
  </div>


</template>

<script>
  import BaseInfo from './component/base-info'
  import InvestorInfo from './component/investor-info'
  import FeeInfo from './component/fee-info'
  import CapitalFlow from './component/capital-flow'
  import MarketValue from './component/market-value'
  import ShareHolding from './component/share-holding'
  import TradeSituation from './component/trade-situation'
  import ReturnVisit from './component/return-visit'
  export default {
    data () {
      return {
        moduleNav: [
          {id: 'base-info', text: '基本信息'},
          {id: 'investor-info', text: '投资者信息'},
          {id: 'fee-info', text: '交费情况'},
          {id: 'capital-flow', text: '资金流水'},
          {id: 'market-value', text: '市值统计'},
          {id: 'share-holding', text: '持股情况'},
          {id: 'trade-situation', text: '交易情况'},
          {id: 'return-visit', text: '回访记录'}
        ],
        scrollOffset: 0
      }
    },
    methods: {
      goTo (id) {
        // document.getElementById(id).scrollIntoView({block: 'end'})
        this.scrollTop($('#' + id).offset().top - 100)
      },
      scrollTop (scrollTop, mil) {
        if (mil === undefined) {
          mil = 500
        }
        $('html, body').animate({ scrollTop: scrollTop }, { duration: mil, easing: 'swing' })
        // $(window.document).scrollTop(300)
      }
    },
    activated () {
      let that = this
      this.scrollTop(this.scrollOffset, 50)
      $(window.document).unbind('scroll')
      // $('.nav-p').css('color', '#000')
      // $('#base-info-p').css('color', '#42b983')
      $(window.document).scroll(function (e) {
        that.scrollOffset = $(window.document).scrollTop()
        let offset = that.scrollOffset + 100
        for (let i = 0; i < that.moduleNav.length; i++) {
          let nav = that.moduleNav[i]
          let offsetTop = $('#' + nav.id).offset().top
          if (offset > offsetTop - 20 && offset < offsetTop + 20) {
            $('.nav-p').css('color', '#000')
            $('#' + nav.id + '-p').css('color', '#42b983')
          }
        }
      })
    },
    mounted () {
    },
    deactivated () {
      $(window.document).unbind('scroll')
    },
    components: {
      BaseInfo,
      InvestorInfo,
      CapitalFlow,
      MarketValue,
      ShareHolding,
      TradeSituation,
      ReturnVisit,
      FeeInfo
    }
  }
</script>

<style>
  .detail-module{
    margin-bottom: 50px;
    border-bottom: solid 2px #eee;
    background-color: white;
    padding-bottom: 50px;
  }
  #nav-div{
    position: fixed;
    top: 300px;
    right: 20px;
    border: 1px solid #eeeeee;
    padding: 5px 20px;
    font-size: 14px;

  }
  #nav-div p{
    cursor: pointer;
  }
  #nav-div p:hover{
    color:#42b983;
    /*#42b983*/
  }
</style>
