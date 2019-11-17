/*
名称:edrawoffice.js
描述:edrawoffice控件JS类库
时间:Vincent.Q 10.11.29
*/

/**********************************************drrawoffice控件 begin************************************************************/

//检测对象是否为Null
function checkIsNull(object) {
    if (object == null)
        return true;

    return false;
}

//检测字符串是否为空
function checkIsEmptyOrUnDefined(data) {
    if (data == "" || typeof (data) == "undefined")
        return true;

    return false;

}

//获取Word.OCX控件对象(需要修改,增加传入参数)
function getObjectWord() {
    return document.OA1.ActiveDocument;
}

//获取Word书签个数
function getBookMarkCount(aobj_word) {
    var i_bookmarkcount = 0;

    //参数检测
    if (checkIsNull(aobj_word)) {
        return i_bookmarkcount;
    }

    i_bookmarkcount = aobj_word.Bookmarks.Count;
    return i_bookmarkcount;
}

//获取Word书签名称列表
function getBookMarkNameList(aobj_word) {
    var array_bookmarkname = new Array();

    //参数检测
    if (checkIsNull(aobj_word)) {
        return array_bookmarkname;
    }

    //获取书签个数
    var i_bookmarkcount = getBookMarkCount(aobj_word);
    if (i_bookmarkcount <= 0) {
        return array_bookmarkname;
    }

    //注意,是从1开始
    for (var i = 1; i < i_bookmarkcount; i++) {
        var s_name = aobj_word.Bookmarks.Item(i).Name;
        array_bookmarkname[i] = s_name;
    }

    return array_bookmarkname;
}

//获取书签名称,根据其索引号
function getBookMarkNameByIndex(array_bookmarknamelist, ai_bookmarkindex) {
    var s_bookmarkname = "";

    //参数检测
    if (array_bookmarknamelist.length <= 0 || ai_bookmarkindex <= 0) {
        return s_bookmarkname;
    }

    s_bookmarkname = array_bookmarknamelist[ai_bookmarkindex];
    return s_bookmarkname;
}

//获取书签索引号,根据其名称
function getBookMarkIndexByName(array_bookmarknamelist, as_bookmarkname) {
    var i_bookmarkindex = 0;

    //参数检测
    if (array_bookmarknamelist.length <= 0 || ai_bookmarkindex <= 0) {
        return s_bookmarkname;
    }

    for (var i = 1; i <= array_bookmarknamelist.length; i++) {
        var s_item = array_bookmarknamelist[i];
        if (s_item != as_bookmarkname) {
            continue;
        }

        i_bookmarkindex = i;
        break;
    }

    return i_bookmarkindex;
}

//获取书签对象,根据其索引号
function getBookMarkByIndex(aobj_word, ai_bookmarkindex) {
    var obj_bookmark = null;
    
    //参数检测
    if (checkIsNull(aobj_word)) {
        return obj_bookmark;
    }

    obj_bookmark = aobj_word.Bookmarks.Item(ai_bookmarkindex);
    return obj_bookmark;

}

//获取书签对象,根据其名称
function getBookMarkByName(aobj_word, array_bookmarknamelist, as_bookmarkname) {
    var obj_bookmark = null;

    //参数检测
    if (checkIsNull(aobj_word)) {
        return obj_bookmark;
    }

    //获取书签索引号
    var i_bookmarkindex = getBookMarkIndexByName(array_bookmarknamelist, as_bookmarkname);

    obj_bookmark = getBookMarkByIndex(aobj_word, i_bookmarkindex);
    return obj_bookmark;
}

//获取书签名称,根据书签对象
function getBookMarkNameByName(aobj_bookmark) {
    var s_bookmarkname = "";

    //参数检测
    if (checkIsNull(aobj_bookmark)) {
        return s_bookmarkname;
    }

    s_bookmarkname = aobj_bookmark.Name;
    return s_bookmarkname;
    
}

//获取书签值,根据书签对象
function getBookMarkValueByName(aobj_bookmark) {
    var s_bookmarkvalue = "";

    //参数检测
    if (checkIsNull(aobj_bookmark)) {
        return s_bookmarkname;
    }

    s_bookmarkvalue = aobj_bookmark.Range.Text;
    return s_bookmarkvalue;
}

function setBookMarkValueByName(aobj_bookmark, as_bookmarkvalue) {
    //参数检测
    if (checkIsNull(aobj_bookmark)) {
        return s_bookmarkname;
    }

    aobj_bookmark.Range.Text = as_bookmarkvalue;
    return false;
    
}

//收集Word书签值,生成字符串
//字符串格式:columnname1,columnvalue1|columnname2,columnvalue2|...
function collectBookMarkValueToString(aobj_word, array_bookmarknamelist) {
    var s_bookmarkvalue = "";

    //参数检测
    if (checkIsNull(aobj_word)) {
        return s_bookmarkvalue;
    }

    if (checkIsEmptyOrUnDefined(array_bookmarknamelist) || array_bookmarknamelist.length <= 0) {
        return s_bookmarkvalue;
    }

    for (var i = 1; i < array_bookmarknamelist.length; i++) {
        //获取书签对象
        var obj_bookmark = getBookMarkByIndex(aobj_word, i);
        if (checkIsNull(obj_bookmark)) {
            continue;
        }

        //书签名称和值
        var s_name = array_bookmarknamelist[i];
        var s_value = getBookMarkValueByName(obj_bookmark);

        //组装
        var s_item = s_name + "," + s_value;
        if (s_bookmarkvalue.toString().length <= 0) {
            s_bookmarkvalue += s_item;
        }
        else {
            s_bookmarkvalue += "|" + s_item;
        }
    }

    return s_bookmarkvalue;
}

function setBookMarkValueByString(aobj_word, array_bookmarkvalue, as_string) {
    return false;
}


//获取Word中Xml结点个数
function getXmlNodeCount(aobj_word) {
    var i_nodecount = 0;

    //参数检测
    if (checkIsNull(aobj_word)) {
        return i_nodecount;
    }

    i_nodecount = aobj_word.XMLNodes.Count;
    return i_nodecount;
}

//获取Word中Xml结点名称列表,生成数组,便于查找结点索引号
function getXmlNodeNameList(aobj_word) {
    var array_xmlnodenamelist = new Array();

    //参数检测
    if (checkIsNull(aobj_word)) {
        return array_xmlnodenamelist;
    }

    //获取结点个数
    var i_xmlnodecount = getXmlNodeCount(aobj_word);
    if (i_xmlnodecount <= 0) {
        return array_xmlnodenamelist;
    }
    
    //注意:从1开始
    for (var i = 1; i <= i_xmlnodecount; i++) {
        var s_name = aobj_word.XMLNodes.Item(i).BaseName;
        array_xmlnodenamelist[i] = s_name;
    }

    return array_xmlnodenamelist;
}

//获取Word中Xml结点名称,根据其索引号
function getXmlNodeNameByIndex(array_xmlnodenamelist, ai_xmlnodeindex) {
    var s_xmlnodename = "";

    //参数检测
    if (checkIsEmptyOrUnDefined(ai_xmlnodeindex)) {
        return s_xmlnodename;
    }

    //判断索引号是否超出名称数组
    if (ai_xmlnodeindex > array_xmlnodenamelist.length) {
        return s_xmlnodename;
    }

    s_xmlnodename = array_xmlnodenamelist[ai_xmlnodeindex];
    return s_xmlnodename;
}

//获取Word中Xml结点索引号,根据其名称
function getXmlNodeIndexByName(array_xmlnodenamelist, as_xmlnodename) {
    var i_xmlnodeindex = 0;

    //参数检测
    if (checkIsEmptyOrUnDefined(as_xmlnodename)) {
        return s_xmlnodename;
    }

    for (var i = 0; i < array_xmlnodenamelist.length; i++) {
        var s_item = array_xmlnodenamelist[i];
        if (s_item == as_xmlnodename) {
            i_xmlnodeindex = i;
            break;
        }
    }

    return i_xmlnodeindex;
}

//获取Word中Xml结点对象,根据结点索引号
function getXmlNodeByIndex(aobj_word, ai_xmlnodeindex) {
    var xml_node = null;

    //参数检测
    if (checkIsNull(aobj_word)) {
        return xml_node;
    }

    //需要判断Word内结点个数
    var i_xmlnodecount = aobj_word.XMLNodes.Count;
    if (ai_xmlnodeindex > i_xmlnodecount) {
        return xml_node;
    }
    
    xml_node = aobj_word.XMLNodes.Item(ai_xmlnodeindex);
    return xml_node;
    
}

//获取Word中Xml结点对象,根据结点名称
//注意:是对象,不是某个结点属性值
function getXmlNodeByName(aobj_word, array_xmlnodenamelist, as_xmlnodename) {
    var xml_node = null;

    //参数检测
    if (checkIsNull(aobj_word)) {
        return xml_node;
    }
    
    //获取结点索引号
    var i_xmlnodeindex = getXmlNodeIndexByName(array_xmlnodenamelist, as_xmlnodename);
    if (i_xmlnodeindex <= 0) {
        return xml_node;
    }

    xml_node = getXmlNodeByIndex(aobj_word, i_xmlnodeindex);
    return xml_node;
}

//获取Word当前选中Xml结点对象
//注意:是对象,不是某个结点属性值
function getXmlNodeBySelected(aobj_word) {
    var xml_node = null;

    //参数检测
    if (checkIsNull(aobj_word)) {
        return xml_node;
    }

    //获取当前选中Xml结点对象
    xml_node = aobj_word.application.Selection.XMLParentNode;
    return xml_node;
}

//获取Word中Xml结点名称,根据Xml结点对象
function getXmlNodeNameByName(axml_node) {
    var s_nodename = "";

    //参数检测
    if (checkIsNull(axml_node)) {
        return s_nodename;
    }

    s_nodename = axml_node.BaseName;
    return s_nodename;
}

//获取Word中Xml结点值,根据Xml结点对象
function getXmlNodeValueByName(axml_node) {
    var s_nodevalue = "";

    //参数检测
    if (checkIsNull(axml_node)) {
        return s_nodevalue;
    }

    s_nodevalue = axml_node.Text;
    return s_nodevalue;
    
}

//Word中Xml结点赋值,根据Xml结品名称
function setXmlNodeValueByName(axml_node,as_xmlnodevalue) {
    //参数检测
    if (checkIsNull(axml_node)) {
        return false;
    }
    
    axml_node.Text = as_xmlnodevalue;
    
    return false;

}

//获取Word中Xml结点自定义属性索引号,根据属性名称
function getXmlNodeAttributeIndexByName(as_attributename) {
    var i_attributeindex = 0;

    if (as_attributename == "comments") {
        i_attributeindex = 1;
    }
    else if (as_attributename = "dbcolumndatatype") {
        i_attributeindex = 2;
    }
    else if (as_attributename == "dbcolumnedittype") {
        i_attributeindex = 3;
    }
    else if (as_attributename == "dbcolumnname") {
        i_attributeindex = 4;
    }
    else if (as_attributename == "dbcolumnvalue") {
        i_attributeindex = 5;
    }
    else if (as_attributename == "dbtablename") {
        i_attributeindex = 6;
    }
    else if (as_attributename == "helpsign") {
        i_attributeindex = 7;
    }

    return i_attributeindex;
}

//获取Word中Xml结点自定义属性索引号,根据属性名称
function getXmlNodeAttributeIndexByXmlNodeAndName(axml_node, as_attributename) {
    var i_attributeindex = 0;

    //获取Xml结点个数
    var i_attributecount = axml_node.Attributes.Count;
    if (i_attributecount <= 0) {
        return i_attributeindex;
    }

    for (var i = 1; i <= i_attributecount; i++) {
        var s_basename = axml_node.Attributes.Item(i).BaseName;
        if (s_basename != as_attributename) {
            continue;
        }
        i_attributeindex = i;
        break;
    }
    
    return i_attributeindex;
    
}

//获取Word中某个Xml结点自定义属性值,根据属性名称
function getXmlNodeAttributeValueByName(axml_node, as_attributename) {
    var s_attributevalue = "";

    //参数检测
    if (checkIsNull(axml_node) || checkIsEmptyOrUnDefined(as_attributename)) {
        return s_attributevalue;
    }

    //获取属性索引号
    //var i_attributeindex = getXmlNodeAttributeIndexByName(as_attributename);
    var i_attributeindex = getXmlNodeAttributeIndexByXmlNodeAndName(axml_node, as_attributename);
    if (i_attributeindex <= 0) {
        return s_attributevalue;
    }

    //需要判断自定义属性个数
    if (axml_node.Attributes.Count <= 0) {
        return s_attributevalue;
    }
    
    s_attributevalue = axml_node.Attributes.Item(i_attributeindex).NodeValue;
    return s_attributevalue;
}

//设置Word中某个Xml结点自定义属性值,根据结点名称和属性名称
function setXmlNodeAttributeValueByName(axml_node, as_attributename, as_attributevalue) {
    //参数检测
    if (checkIsNull(axml_node)) {
        return false;
    }

    if (checkIsEmptyOrUnDefined(as_attributename) || checkIsEmptyOrUnDefined(as_attributevalue)) {
        return false;
    }

    //获取属性索引号
    //var i_attributeindex = getXmlNodeAttributeIndexByName(as_attributename);
    var i_attributeindex = getXmlNodeAttributeIndexByXmlNodeAndName(axml_node, as_attributename);
    if (i_attributeindex <= 0) {
        return false;
    }

    //赋值
    axml_node.Attributes.Item(i_attributeindex).NodeValue = as_attributevalue;
    return false;
}

//收集Word中Xml结点列表,拼接为字符串
//增加结点名称数组参数,原因:提高性能 modify by Vincent.Q 10.12.02
//需要判断结点的dbcolumnedittype属性值,若是dropdownlist,则需要获取dbcolumnvalue属性值
function collectXmlNodeValueToString(aobj_word, array_xmlnodenamelist) {
    var s_xmlnodevalue = "";

    //参数检测
    if (checkIsNull(aobj_word)) {
        return s_xmlnodevalue;
    }

    if (checkIsEmptyOrUnDefined(array_xmlnodenamelist)) {
        return s_xmlnodevalue;
    }

    if (array_xmlnodenamelist.length <= 0) {
        return s_xmlnodevalue;
    }

    //循环结点名称列表,
    for (var i = 1; i <= array_xmlnodenamelist.length; i++) {
        //获取Xml结点对象,若为null,则continue
        var xml_node = getXmlNodeByIndex(aobj_word, i);
        if (checkIsNull(xml_node)) {
            continue;
        }

        var s_nodename = "";    //结点名称
        var s_nodevalue = "";   //结点值

        s_nodename = getXmlNodeNameByIndex(array_xmlnodenamelist, i);

        //获取dbcolumnedittype属性
        //若是textbox,则取结点值,若是dropdownlist,则取dbcolumnvalue属性值        
        var s_dbcolumnedittype = getXmlNodeAttributeValueByName(xml_node, "dbcolumnedittype");
        if (s_dbcolumnedittype == "textbox") {
            s_nodevalue = getXmlNodeValueByName(xml_node);
        }
        else if (s_dbcolumnedittype == "dropdownlist") {
            //判断是否存在控件.若存在,则获取控件值,没有则获取自定义属性值
            var obj_control = getXmlNodeControl(xml_node);
            if (checkIsNull(obj_control)) {
                s_nodevalue = getXmlNodeAttributeValueByName(xml_node, "dbcolumnvalue");
            }
            else {
                s_nodevalue = getXmlNodeControlValue(obj_control);
            }
        }
        if (checkIsEmptyOrUnDefined(s_nodevalue)) {
            s_nodevalue = "";
        }

        //组装
        var s_item = s_nodename + "," + s_nodevalue;
        if (s_xmlnodevalue.toString().length <= 0) {
            s_xmlnodevalue += s_item;
        }
        else {
            s_xmlnodevalue += "|" + s_item;
        }
    }

    return s_xmlnodevalue;
}

//赋值Word中Xml结点值,根据字符串
//增加Xml结点名称数组,原因:提高性能
function setXmlNodeValueByString(aobj_word, array_xmlnodenamelist, as_string) {
    //参数检测
    if (checkIsNull(aobj_word)) {
        return false;
    }

    if (checkIsEmptyOrUnDefined(array_xmlnodenamelist) || checkIsEmptyOrUnDefined(as_string)) {
        return false;
    }

    if (array_xmlnodenamelist.length <= 0) {
        return false;
    }

    var array_data = as_string.toString().split("|");
    if (array_data.length <= 0) {
        return false;
    }

    for (var i = 0; i < array_data.length; i++) {
        var s_item = array_data[i];
        var array_columnvalue = s_item.split(",");

        if (array_columnvalue.length >= 2) {
            //xml结点名称,结点值
            var s_nodename = array_columnvalue[0];
            var s_nodevalue = array_columnvalue[1];

            //根据结点名称,获取结点索引号
            //根据索引号,获取Xml结点对象
            var i_nodeindex = getXmlNodeIndexByName(array_xmlnodenamelist, s_nodename);
            var xml_node = getXmlNodeByIndex(aobj_word, i_nodeindex);

            //赋值
            setXmlNodeValueByName(xml_node, s_nodevalue);
            setXmlNodeAttributeValueByName(xml_node, "dbcolumnvalue", s_nodevalue);
        }
    }

    return false;
}

//获取Word中Xml结点所属控件
//当前业务,Xml结点中只有一个控件,参数只有XmlNode结点即可
function getXmlNodeControl(axml_node) {
    var obj_control = null;

    //参数检测
    if (checkIsNull(axml_node)) {
        return obj_control;
    }

    //判断控件个数
    var i_controlcount = axml_node.Range.ContentControls.Count;
    if (i_controlcount <= 0) {
        return obj_control;
    }

    //获取控件对象
    obj_control = axml_node.Range.ContentControls.Item(1);
    return obj_control;
}

//获取Word中Xml结点所属控件,根据控件名称
function getXmlNodeControlByName(axml_node, as_controlid) {
    var obj_control = null;

    //参数检测
    if (checkIsNull(axml_node)) {
        return obj_control;
    }

    //判断控件个数
    var i_controlcount = axml_node.Range.ContentControls.Count;
    if (i_controlcount <= 0) {
        return obj_control;
    }

    //循环控件,根据Tag获取其ID,比较是否相同
    for (var i = 1; i <= i_controlcount; i++) {
        var s_controlid = axml_node.Range.ContentControls.Item(i).Tag;
        if (s_controlid != as_controlid) {
            continue;
        }

        obj_control = axml_node.Range.ContentControls.Item(i);
        break;
    }

    return obj_control;
}

//加载Word中Xml结点控件值(下拉菜单)
//aobj_xmlnodecontrol   Xml结点中控件对象
//adbtable_data         json格式数据
//as_datacolumn         数据列
//as_dispcolumn         显示列
function buildDataXmlNodeControl(aobj_xmlnodecontrol, adbtable_data, as_datacolumn, as_dispcolumn) {

    //参数检测
    if (checkIsNull(aobj_xmlnodecontrol) || checkIsNull(adbtable_data)) {
        return false;
    }

    if (checkIsEmptyOrUnDefined(as_datacolumn) || checkIsEmptyOrUnDefined(as_dispcolumn)) {
        return false;
    }

    //获取json数据行数
    var i_rowcount = adbtable_data.length;
    if (i_rowcount <= 0) {
        return false;
    }

    //获取控件类型,4为下拉菜单
    var s_controltype = aobj_xmlnodecontrol.Type;
    if (s_controltype != "4") {
        return false;
    }

    //清空控件项
    aobj_xmlnodecontrol.DropdownlistEntries.Clear();

    //默认增加第1项
    aobj_xmlnodecontrol.DropdownlistEntries.Add("请选择一项", "0", 0);
    
    //加载数据项
    for (var i = 0; i < i_rowcount; i++) {
        var s_data = adbtable_data[i][as_datacolumn];
        var s_disp = adbtable_data[i][as_dispcolumn];
        aobj_xmlnodecontrol.DropdownlistEntries.Add(s_disp, s_data, i + 1);
    }

    return false;

}

//获取Word中XmlNode结点中控件Text值
function getXmlNodeControlText(aobj_xmlnodecontrol) {
    var s_controltext = "";

    //参数检测
    if (checkIsNull(aobj_xmlnodecontrol)) {
        return s_controltext;
    }

    //获取控件值
    s_controlvalue = aobj_xmlnodecontrol.Range.Text;
    return s_controlvalue;

}

//获取Word中XmlNode结点中控件Value值
//若是日期控件,需要获取Text值
//若是下拉菜单,需要获取Value值
function getXmlNodeControlValue(aobj_xmlnodecontrol) {
    var s_controlvalue = "";

    //参数检测
    if (checkIsNull(aobj_xmlnodecontrol)) {
        return s_controlvalue;
    }

    //获取控件值
    var s_controltype = aobj_xmlnodecontrol.Type;
    
    //若是下拉菜单,则获取Value值,根据Text值获取索引号,再获取Value值
    if (s_controltype == "4") {
        //获取显示值
        var s_text_base = getXmlNodeControlText(aobj_xmlnodecontrol);
        
        //获取项目个数
        var i_itemcount = aobj_xmlnodecontrol.DropdownListEntries.Count;
        if (i_itemcount > 0) {
            for (var i = 1; i <= i_itemcount; i++) {
                var s_value = aobj_xmlnodecontrol.DropdownListEntries.Item(i).Value;
                var s_text = aobj_xmlnodecontrol.DropdownListEntries.Item(i).Text;
                if (s_text_base != s_text) {
                    continue;
                }
                s_controlvalue = s_value;
                break;
            }
        }
    }
    else if (s_controltype == "6") {
        s_controlvalue = aobj_xmlnodecontrol.Range.Text;
    }
    return s_controlvalue;    
}

//收集实体属性值,单独封装.原因:以后书签或结点均可能使用
//as_style:1,书签|2,结点
function collectEntityPropertyValueToString(aobj_word, array_namelist, as_style) {
    var s_propertyvalue = "";

    //书签
    if (as_style == "1") {
        s_propertyvalue = collectBookMarkValueToString(aobj_word, array_namelist);
    }
    else if (as_style == "2") {
        s_propertyvalue = collectXmlNodeValueToString(aobj_word, array_namelist);
    }

    return s_propertyvalue;
}

//实体属性值赋值,单独封装.原因:以后书签或结点均可能使用
//as_style:1,书签|2,结点
function setEntityPropertyValueByString(aobj_word, array_namelist, as_string, as_style) {
    //书签
    if (as_style == "1") {
        setBookMarkValueByString(aobj_word, array_namelist, as_string);
    }
    else if (as_style = "2") {
        setXmlNodeValueByString(aobj_word, array_namelist, as_string);
    }

    return false;
}

/**********************************************drrawoffice控件 end**************************************************************/