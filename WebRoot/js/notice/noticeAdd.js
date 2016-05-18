/**

 * @author boyd
 * @version 1.0
 * @description 公告
 */

$(function(){

	//发布公告
	$("#at_submit1").click(function(){
		
		var noticeTitle=$("#noticeTitle").val();
		var noticeType=$("#noticeType").val();
	//	var noticeContent=CKEDITOR.instances.noticeContent.getData();
		var noticeContent = editor.getValue();

		if(noticeTitle=="")
		{
			joy.alert("话题标题不能为空");
			return;
		}
		else if(noticeType=="")
		{
			joy.alert("话题类别不能为空");
			return;
		}
		else if(noticeContent=="")
		{
			joy.alert("话题内容不能为空");
			return;
		}else
		{
			document.noticeForm.submit();
		}
		
	});
});
