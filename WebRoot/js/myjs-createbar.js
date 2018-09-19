//选项卡以及步骤控制
$(function() {
	$("#create-a4").click(function() {
		$('#create-a1').click();
	});
	$("#create-a5").click(function() {
		$('#create-a0').click();
	});
	$("#create-a6").click(function() {
		$('#create-a2').click();
	});
	$("#create-a7").click(function() {
		$('#create-a1').click();
	});
})


/*bootstrap验证*/

$(document).ready(function() {
	$('#bataiForm')
		.formValidation({
			excluded: [':disabled'],
			icon: {
				valid: 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
			},
			fields: {
				interestGroupName: {
					validators: {
						notEmpty: {
							message: '名字不能为空'
						},
						stringLength: {
							min: 1,
							max: 15,
							message: '长度不能超过15个字符'
						},
					}
				},
				interestGroupBg: {
					validators: {
						file: {
							extension: 'jpg,jpeg,gif,png',
							type: 'image/jpeg,image/png,image/gif',
							message: '请选择一张图片(类型jpg,jpeg,gif,png).'
						}
					}
				},
				interestGroupDesc: {
					validators: {
						stringLength: {
							min: 0,
							max: 35,
							message: '长度不能超过35个字符'
						},
					}
				},
				interestId: {
					validators: {
						notEmpty: {
							message: '必须选择一个兴趣类型'
						}
					}
				},
				applyReason: {
					validators: {
						stringLength: {
							min: 0,
							max: 15,
							message: '长度不能超过15个字符'
						},
					}
				},
				userRealName: {
					validators: {
						notEmpty: {
							message: '名字不能为空'
						},

					}
				},
				userBirthday: {
					validators: {
						date: {
							format: 'YYYY/MM/DD',
							message: '生日无效'
						}
					}
				},
				userIdCard: {
					validators: {
						notEmpty: {
							message: '身份证号不能为空'
						},

						stringLength: {
							min: 18,
							max: 18,
							message: '不符合格式，必须为18位'

						}
					}
				},
				userEmail: {
					validators: {
						notEmpty: {
							message: '邮件不能为空'
						},
						emailAddress: {
							message: '输入的不是一个有效的电子邮件地址'
						}
					}
				},
				userPhoneNumber: {
					validators: {
						notEmpty: {
							message: '电话号码不能为空'
						},
						digits: {
							message: '电话号码只能是数字'
						},
						stringLength: {
							min: 11,
							max: 11,
							message: '不符合格式，必须为11位'

						}
					}
				},
				agree: {
					validators: {
						notEmpty: {
							message: '必须同意协议才能提交'
						}
					}
				}
			}
		})
		.on('err.form.fv', function(e) {
			var $form = $(e.target),
				fv = $form.data('formValidation'),
				$invalidFields = fv.getInvalidFields();

			for (var i = 0; i < $invalidFields.length; i++) {
				var $field = $invalidFields.eq(i),
					autoFocus = fv.isOptionEnabled($field.attr('data-fv-field'), 'autoFocus');

				if (autoFocus) {
					// Activate the tab containing the field if exists
					var $tabPane = $field.parents('.tab-pane'),
						tabId;
					if ($tabPane && (tabId = $tabPane.attr('id'))) {
						$('a[href="#' + tabId + '"][data-toggle="tab"]').tab('show');
					}
					break;
				}
			}
		})
		.on('status.field.fv', function(e, data) {
			var validator = data.fv,
				$tabPane = data.element.parents('.tab-pane'),
				tabId = $tabPane.attr('id');
			//		            if (tabId) {
			//		                var $icon = $('a[href="#' + tabId + '"][data-toggle="tab"]').parent().find('i');
			//
			//		                // Add custom class to tab containing the field
			//		                if (data.status == validator.STATUS_INVALID) {
			//		                    $icon.removeClass('glyphicon-ok').addClass('glyphicon-remove');
			//		                } else if (data.status == validator.STATUS_VALID) {
			//		                    $icon.removeClass('glyphicon-ok glyphicon-remove');
			//
			//		                    var isValidTab = validator.isValidContainer($tabPane);
			//		                    if (isValidTab !== null) {
			//		                        $icon.addClass(isValidTab ? 'glyphicon-ok' : 'glyphicon-remove');
			//		                    }
			//		                }
			//		            }
		});

	$('.addButton').on('click', function() {
		var $template = $('#emailTemplate'),
			$row = $template.clone().removeAttr('id').insertAfter('#emailRow').removeClass('hide'),
			$el = $row.find('input').eq(0);
		$('#accountForm').formValidation('addField', $el);

		$row.on('click', '.removeButton', function(e) {
			$('#accountForm').formValidation('removeField', $el);
			$row.remove();
		});
	});
});