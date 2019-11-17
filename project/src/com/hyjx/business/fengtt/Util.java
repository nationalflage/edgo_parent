package com.hyjx.business.fengtt;

import com.hyjx.framework.common.CommonUtil;
import com.hyjx.framework.component.codetable.CodeBean;
import com.hyjx.framework.component.codetable.CodeTableManager;

import java.util.ArrayList;
import java.util.List;

class Util {
    /**
     * 多选码表转码
     * @param scode
     * @param model
     * @return null
     */
    static void changeMutiCode(String scode,FengttModel model,String codeTable){
        if(scode!=null) {
            List<String> ss = new ArrayList<String>();
            String ss1 = "";
            //复选
            if(scode.contains(",")){
                String[] Scode1 = scode.split(",");
                for (String str : Scode1) {
                    String sclys = CodeTableManager.getNameByCode(codeTable, str);
                    ss.add(sclys);
                }
                for (int i = 0; i < ss.size(); i++) {
                    if (ss1 == "") {
                        ss1 = ss.get(i);
                    } else {
                        ss1 = ss1 + "," + ss.get(i);
                    }
                }
            }else{
                //单选
                String zsc = CodeTableManager.getNameByCode(codeTable, scode);
                model.setZsc(zsc);
                return;
            }

            if("fengttAh".equals(codeTable)){
                model.setAh(ss1);
            }else{
                model.setScly(ss1);
            }

        }
    }

    public static String getSclyJson(){
        //scly封装成json
        class sclyPojo{
            String id;
            String text;

            public String getId() {
                return id;
            }

            public void setId(String id) {
                this.id = id;
            }

            public String getText() {
                return text;
            }
            public void setText(String text) {
                this.text = text;
            }
        }
        List<CodeBean> sclyList = CodeTableManager.getTableList("fengttScly");
        List<sclyPojo> li = new ArrayList<sclyPojo>();
        for(CodeBean cc:sclyList){
            sclyPojo temp = new sclyPojo();
            temp.setId(cc.getCode());
            temp.setText(cc.getName());
            li.add(temp);
        }
        String liJson = CommonUtil.getJsonString(li);
        return liJson;
    }

}
