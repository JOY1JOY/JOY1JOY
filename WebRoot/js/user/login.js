/**
* duansy
**/

$(function() {
	
	$(".flatReg").click(function(){
		
		window.location.href=joy.getContextPath()+"/user/register.action";
	});
	
    $('#login').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok ',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        submitHandler:function(validator, form, submitButton) {
        	$.post(joy.getContextPath() +'/user/login.action', form.serialize(), 
        			function(re) {
        				if(re.result=="success"){
        			      window.location = joy.getContextPath() + "/home.action?d="
 							+ new Date();
        				}
        				 if(re.result=="passError")
    					 {
    						 joy.alert("密码输入错误");
    						 return;
    					 }
    					 if(re.result=="noExit")
    					 {
    						 joy.alert("用户名不存在");
    						 return;
    					 }
            		}, 'json');
        },
        fields: {
        	userId: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            },
            
        }
    });
});