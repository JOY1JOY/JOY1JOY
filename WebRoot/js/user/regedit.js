/**
* duansy
**/

$(function() {
	
	//立即登录
	$(".flatLogin").click(function(){
		
		window.location.href=joy.getContextPath()+"/user/jumpLogin.action";
	});
	
    $('#register').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok ',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        submitHandler:function(validator, form, submitButton) {
        	$.post(joy.getContextPath() +'/user/saveUser.action', form.serialize(), 
        			function(re) {
        				if(re.result=="success"){
        					joy.alert("注册成功，请登录!", function() {
								window.location = joy.getContextPath() + "/user/jumpLogin.action?d="
										+ new Date();
							});
        				}else
						 {
							 joy.alert("注册失败，请重新注册");
							 return;
						 }
            		}, 'json');
        },
        fields: {
        	userId: {
        	    trigger: 'blur',
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    remote: {
                        url:joy.getContextPath() + '/user/findUser.action',
                        message: '用户名已存在',
                        name:'userId'
                    },
                
                }
            },
            password: {
            	selector: '#onePass',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: '两次输入密码不一致'
                    }
                }
            },
            confirmPassword: {
            	selector: '#twoPass',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    identical: {
                        field: 'password',
                        message: '两次输入密码不一致'
                    }
                }
            },
            email: {
            	selector: '#userEmail',
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: '邮箱格式不正确'
                    }
                }
            },
            phoneNumber: {
            	selector:'#userPhone',
                validators: {
                    digits: {
                        message: 'The value can contain only digits'
                    }
                }
            },
            
            acceptTerms: {
                validators: {
                    notEmpty: {
                        message: '请同意条例'
                    }
                }
            },


        }
    });
});