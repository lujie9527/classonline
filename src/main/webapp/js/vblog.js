/**
 * ���ڶ���Ƶ�Ľ������ۣ��ղأ��Ƽ��Ȳ�����
 * @param action
 * @param url
 */
function vblogOpt(action, url,data) {
    if(url.indexOf("?")<0){
        url = url+"?"+"_r="+Math.random();;
    }else{
        url = url+"&_r="+Math.random();
    }
    if(data==undefined)
        data = '{["a","1"],["b","2"]}';
    if (action == "comment") { //���ۣ�
        $.post(url,data, callback);
    } else if (action == "addfavorite") {//�ղأ�
        $.post(url,data, callback);
    } else if (action == "recommend") {//�Ƽ�
        $.post(url,data, callback);
    }
}
function callback(data) {
    var jsonobj = null;
    try {
        jsonobj = $.parseJSON(data);
    } catch(e) {
        alert(e.message);
    }
    if (jsonobj.errorsize == '0') {
        if(jsonobj.objId != undefined){
            var oIdStr = jsonobj.objId;
            if( oIdStr.indexOf("favorite")>0)
                $("#"+ jsonobj.objId).removeClass("ico_favorite").addClass("ico_cancelfavorite");
            else if( oIdStr.indexOf("recommend")>0)
                $("#"+ jsonobj.objId).removeClass("ico_recommend").addClass("ico_cancelrecommend");
        }

        alert(jsonobj.msg);
    } else {
        alert(jsonobj.msg);
    }
}
