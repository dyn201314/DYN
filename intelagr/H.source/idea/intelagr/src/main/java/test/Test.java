package test;

import java.util.*;

public class Test {
    public static void main(String[] args) {
        List<Student> list = new ArrayList<Student>();
        list.add(new Student("Tom", 18, 100, "class05"));
        list.add(new Student("Jerry", 22, 70, "class04"));
        list.add(new Student("Owen", 25, 90, "class05"));
        list.add(new Student("Jim", 30,80 , "class05"));
        list.add(new Student("Steve", 28, 66, "class06"));
        list.add(new Student("Kevin", 24, 100, "class04"));

        //遍历List 将班级编号存入到Set集合
        //遍历Set集合的班级  和 List集合中学生班级比对，相同则输出
        /*Set<String> set = new HashSet<String>();
        List<Map<String,Object>> menuList = new ArrayList<Map<String,Object>>();
        for(Student s:list){
            set.add(s.getClassName());
        }
        for(String className:set){
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("parent", className);
            List<Student> chilren= new ArrayList<Student>();
            for(Student s:list){
                if(s.getClassName().equals(className)){
                   chilren.add(s);
                }
            }
            map.put("child", chilren);
            menuList.add(map);
        }*/
        TreeSet<Student> treeSet = new TreeSet<Student>();
        for(Student s:list){
            treeSet.add(s);
        }
        System.out.println(treeSet);
    }
}
