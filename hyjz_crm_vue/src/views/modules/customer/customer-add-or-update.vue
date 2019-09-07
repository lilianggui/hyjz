<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="姓名" prop="custName">
        <el-input v-model="dataForm.custName" placeholder="姓名"></el-input>
      </el-form-item>
      <el-form-item label="手机" prop="custPhone" :class="{ 'is-required': !dataForm.id }">
        <el-input v-model="dataForm.custPhone" placeholder="手机"></el-input>
      </el-form-item>
      <el-form-item label="开发人" prop="developer" :class="{ 'is-required': !dataForm.id }">
        <el-input v-model="dataForm.developer" placeholder="开发人"></el-input>
      </el-form-item>
      <el-form-item label="负责人" prop="chargePerson">
        <el-input v-model="dataForm.chargePerson" placeholder="负责人"></el-input>
      </el-form-item>
      <el-form-item label="初始市值" prop="initMarketValue">
        <el-input v-model.number="dataForm.initMarketValue" placeholder="初始市值"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import { isMobile } from '@/utils/validate'
  export default {
    data () {
      var validateMobile = (rule, value, callback) => {
        if (!isMobile(value)) {
          callback(new Error('手机号格式错误'))
        } else {
          callback()
        }
      }
      return {
        visible: false,
        roleList: [],
        dataForm: {
          id: 0,
          custName: '',
          cusrPhone: '',
          developer: '',
          initMarketValue: '',
          chargePerson: '',
          roleIdList: [],
          status: 1
        },
        dataRule: {
          custName: [
            { required: true, message: '姓名不能为空', trigger: 'blur' }
          ],
          custPhone: [
            { validator: validateMobile, trigger: 'blur' }
          ],
          developer: [
            { required: true, message: '开发人不能为空', trigger: 'blur' }
          ],
          chargePerson: [
            { required: true, message: '负责人不能为空', trigger: 'blur' }
          ],
          initMarketValue: [
            { required: true, message: '初始市值不能为空', trigger: 'blur' },
            {type: 'number', message: '初始市值必须为数字'}
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
        })
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/customer/getCustomerById/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.custName = data.data.custName
              this.dataForm.custPhone = data.data.custPhone
              this.dataForm.developer = data.data.developer
              this.dataForm.chargePerson = data.data.chargePerson
              this.dataForm.initMarketValue = data.data.initMarketValue
            }
          })
        }
      },
      // 表单提交
      dataFormSubmit () {
        console.log(this.dataForm)

        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/customer/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'custId': this.dataForm.id || undefined,
                'custName': this.dataForm.custName,
                'custPhone': this.dataForm.custPhone,
                'developer': this.dataForm.developer,
                'chargePerson': this.dataForm.chargePerson,
                'initMarketValue': this.dataForm.initMarketValue
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
