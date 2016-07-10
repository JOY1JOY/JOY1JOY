/**

 * @author boyd
 * @version 1.0
 * @description 公告
 */

var JOY_URL_NOTICE_UPDATE = joy.getContextPath() + "/notice/update.action";


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
			
			var opt_type = $("#at_optType").val();
			var isAdd = true;
			var Aid=$("#at_id").val();
			if (1 == opt_type) {
				isAdd = false;
				url = JOY_URL_NOTICE_UPDATE;
				if (Aid == "") {
					tip("非法操作!");
					return false;
				}
				else{
				document.noticeForm.action=url;	
				}
			}
			alert(document.noticeForm.action);
			document.noticeForm.submit();
		}
		
	});
});
