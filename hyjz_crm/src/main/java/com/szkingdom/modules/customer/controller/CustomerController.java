package com.szkingdom.modules.customer.controller;

import com.szkingdom.common.utils.PageUtils;
import com.szkingdom.common.utils.R;
import com.szkingdom.modules.customer.entity.Customer;
import com.szkingdom.modules.customer.service.interfaces.CustomerService;
import com.szkingdom.modules.sys.controller.AbstractController;
import com.szkingdom.modules.sys.service.SysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

@RestController
@RequestMapping("/customer")
public class CustomerController extends AbstractController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private SysUserService sysUserService;
    /**
     * 所有客户列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = customerService.queryPage(params);
        return R.ok().put("page", page);
    }
    /**
     * 根据客户id获取客户
     */
    @GetMapping("/getCustomerById/{customerId}")
    public R getCustomerById(@PathVariable("customerId") Long customerId){

        return R.ok().put("data", customerService.selectById(customerId));
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody Customer customer){
        return R.ok().put("data", customerService.insert(customer));
    }

    /**
     * 更新
     */
    @PostMapping("/update")
    public R update(@RequestBody Customer customer){
        return R.ok().put("data", customerService.updateById(customer));
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(@RequestBody Long[] customer){
        return R.ok().put("data", customerService.deleteBatchIds(Arrays.asList(customer)));
    }

}
