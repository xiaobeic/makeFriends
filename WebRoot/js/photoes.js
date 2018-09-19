　var myDiv = $("#myDiv");
$(function ()
{
$("#btn").click(function (event) 
{
showDiv();//调用显示DIV方法
$(document).one("click", function () 
{//对document绑定一个影藏Div方法
$(myDiv).hide();
});
 
event.stopPropagation();//阻止事件向上冒泡
});
$(myDiv).click(function (event) 
{
 
event.stopPropagation();//阻止事件向上冒泡
});
});
　　　　function showDiv() 
{
$(myDiv).fadeIn();
}	
/*表单验证*/
$(document).ready(function() {
$('#photoInfo').bootstrapValidator({
message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields:{
			mingcheng:{
				validators:{
					notEmpty:{
						message:'名称不能为空'
					},
					stringLength:{
						min:1,
						max:5,
						message:'名称长度为1~5个字符'
					},
				}
			},
			miaoshu:{
				validators:{
					stringLength:{
						min:0,
						max:20,
						message:'长度不能超过20个字符'
					},
				}
			},
		}
});
});