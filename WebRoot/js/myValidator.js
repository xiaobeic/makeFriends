/**
 * 主页登录注册验证
 */
$(document).ready(function() {
	function randomNumber(min, max) {
		return Math.floor(Math.random() * (max - min + 1) + min);
	};
	$('#loginForm').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			userName: {
				validators: {
					notEmpty: {
						message: '账户不能为空'
					},
					stringLength: {
						min: 1,
						max: 10,
						message: '账户长度为1~20个字符'
					},
				}
			},password: {
				validators: {
					notEmpty: {
						message: '密码不能为空'
					},
					stringLength: {
						min: 1,
						max: 10,
						message: '密码长度为4~20个字符'
					},
				}
			}
			
		}
	});
	
	$('#regForm').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			userName: {
				validators: {
					notEmpty: {
						message: '账户不能为空'
					},
					stringLength: {
						min: 1,
						max: 20,
						message: '账户长度为1~20个字符'
					},
				}
			},nickName: {
				validators: {
					notEmpty: {
						message: '账户不能为空'
					},
					stringLength: {
						min: 1,
						max: 30,
						message: '账户长度为1~30个字符'
					},
				}
			},password: {
				validators: {
					notEmpty: {
						message: '密码不能为空'
					},
					stringLength: {
						min: 1,
						max: 10,
						message: '密码长度为4~20个字符'
					},
				}
			},verifyCode: {
				validators: {
					notEmpty: {
						message: '验证码不能为空'
					}
				}
			}
			
		}
	});
});

/**
 *个人中心账户设置验证 
 */
$(document).ready(function() {
	function randomNumber(min, max) {
		return Math.floor(Math.random() * (max - min + 1) + min);
	};
	
	$('#baseInfo').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			nickName: {
				validators: {
					notEmpty: {
						message: '昵称不能为空'
					},
					stringLength: {
						min: 1,
						max: 10,
						message: '昵称长度为1~10个字符'
					},
				}
			},
			email: {
				validators: {
					emailAddress: {
						message: '无效的邮箱地址'
					}
				}
			},
			phoneNum: {
				validators: {
					digits: {
						message: '无效的手机号'
					},
					stringLength: {
						min: 11,
						max: 11,
						message: '手机号长度为11个字符'
					},
				}
			},
		}
	});
	$('#personInfo').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			realName: {
				validators: {
					stringLength: {
						min: 2,
						max: 5,
						message: '姓名长度为2~5个字符'
					},
				}
			},
			signature: {
				validators: {
					stringLength: {
						min: 0,
						max: 35,
						message: '长度不能超过35个字符'
					},
				}
			},
			birth: {
                validators: {
                    date: {
                        format: 'YYYY-MM-DD',
                        message: '日期格式为YYYY-MM-DD'
                    }
                }
            },
		}
	});
	$('#passwordInfo').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			oldPassword: {
				validators: {
					notEmpty: {
						message: '当前密码不能为空'
					},
					different: {
						field: 'newPassword',
						message: '旧密码和新密码不能相同'
					},
					stringLength: {
						min: 6,
						max: 18,
						message: '密码长度为6~18个字符'
					},
				}
			},
			newPassword: {
				validators: {
					notEmpty: {
						message: '新密码不能为空'
					},
					identical: {
						field: 'confirmPassword',
						message: '两次输入的新密码不同'
					},
					different: {
						field: 'oldPassword',
						message: '新密码和旧密码不能相同'
					},
					stringLength: {
						min: 6,
						max: 18,
						message: '密码长度为6~18个字符'
					},
				}
			},
			confirmPassword: {
				validators: {
					notEmpty: {
						message: '确认密码不能为空'
					},
					identical: {
						field: 'newPassword',
						message: '两次输入的新密码不同'
					},
					stringLength: {
						min: 6,
						max: 18,
						message: '密码长度为6~18个字符'
					},
				}
			},
		}
	});
});