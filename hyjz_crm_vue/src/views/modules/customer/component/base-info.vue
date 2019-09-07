<template>
  <div>
    <el-form :inline="true" :rules="baseInfoRules"
             :model="baseInfo" label-width="120px" style="width: 1450px"
             :disabled="!updating" ref="baseInfoForm">
      <el-form-item label="名称" prop="custName">
        <el-input v-model="baseInfo.custName" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="手机" prop="custPhone">
        <el-input v-model="baseInfo.custPhone" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="地区" prop="custArea">
        <el-input v-model="baseInfo.custArea" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="开始日期" prop="startDate">
        <el-date-picker type="date" v-model="baseInfo.startDate" class="detail-input" value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
      </el-form-item>
      <el-form-item label="结束日期" prop="endDate">
        <el-date-picker type="date" v-model="baseInfo.endDate" class="detail-input" value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
      </el-form-item>
      <el-form-item label="开发人" prop="developer">
        <el-input v-model="baseInfo.developer" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="负责人" prop="chargePerson">
        <el-input v-model="baseInfo.chargePerson" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="交易员" prop="trader">
        <el-input v-model="baseInfo.trader" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="初始市值" prop="initMarketValue">
        <el-input v-model="baseInfo.initMarketValue" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="本金" prop="principal">
        <el-input v-model="baseInfo.principal" class="detail-input"></el-input>
      </el-form-item>
      <el-form-item label="备注" prop="remark">
        <el-input type="textarea" :rows="3" v-model="baseInfo.remark" class="detail-input-area"></el-input>
      </el-form-item>
    </el-form>
    <el-button v-if="!updating" @click="updating=true" size="mini" type="primary" style="margin-left: 120px">修改</el-button>
    <el-button v-if="updating"  @click="saveBaseInfo" size="mini" type="primary" style="margin-left: 120px">保存</el-button>
    <!--<el-button v-if="updating"  @click="updating=false" size="mini" style="margin-left: 30px">取消</el-button>-->
  </div>
</template>


<script>
  export default {
    name: 'base-info',
    data () {
      return {
        updating: false,
        custId: 0,
        baseInfo: {},
        baseInfoRules: {
          custName: [
            { required: true, message: '客户名称不能为空', trigger: 'blur' },
            { min: 1, max: 16, message: '长度在 1 到 16 个字符', trigger: 'blur' }
          ],
          custPhone: [
            { required: true, message: '手机不能为空', trigger: 'blur' },
            { pattern: /^1[34578]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
          ],
          custArea: [
            { required: true, message: '地区不能为空', trigger: 'blur' },
            { min: 1, max: 32, message: '长度在 1 到 32 个字符', trigger: 'blur' }
          ],
          startDate: [
            { required: true, message: '请选择开始时间', trigger: 'change' }
          ],
          endDate: [
            { required: true, message: '请选择结束时间', trigger: 'change' }
          ],
          developer: [
            { required: true, message: '开发人不能为空', trigger: 'blur' },
            { min: 1, max: 16, message: '长度在 1 到 16 个字符', trigger: 'blur' }
          ],
          chargePerson: [
            { required: true, message: '负责人不能为空', trigger: 'blur' },
            { min: 1, max: 16, message: '长度在 1 到 16 个字符', trigger: 'blur' }
          ],
          trader: [
            { required: true, message: '交易员不能为空', trigger: 'blur' },
            { min: 1, max: 16, message: '长度在 1 到 16 个字符', trigger: 'blur' }
          ],
          initMarketValue: [
            { required: true, message: '初始市值不能为空', trigger: 'blur' },
            { pattern: /^[0-9]+(\.[0-9]{2})?$/, message: '必须为数字，可输入两位小数', trigger: 'blur' }
          ],
          principal: [
            { required: true, message: '本金不能为空', trigger: 'blur' },
            { pattern: /^[0-9]+(\.[0-9]{2})?$/, message: '必须为数字，可输入两位小数', trigger: 'blur' }
          ],
          remark: [
            { max: 256, message: '最多256个字符', trigger: 'blur' }
          ]
        }
      }
    },
    activated () {
      this.custId = this.$route.query.custId
      this.getDataList()
    },
    methods: {
      getDataList () {
        this.$http({
          url: this.$http.adornUrl('/customer/getCustomerById/' + this.custId),
          method: 'get'
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.baseInfo = data.data
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      saveBaseInfo () {
        this.$refs['baseInfoForm'].validate((valid) => {
          if (valid) {
            var that = this
            this.$http({
              url: this.$http.adornUrl('/customer/update'),
              method: 'post',
              data: this.$http.adornData(this.baseInfo)
            }).then(({data}) => {
              if (data && data.code === 0) {
                that.updating = false
                that.getDataList()
                that.$message.success('保存成功')
              } else {
                that.$message.error(data.msg)
              }
            })
          } else {
            console.log('error submit!!')
            return false
          }
        })
      }
    }
  }
</script>


<style>
  .detail-input{
    width: 300px !important;
  }
  .detail-input-area{
    width: 730px;
  }
</style>
