
class Person {
    String name="张三";
    int age =23;
    //默认构造函数 跟Java一样
    Person(){
         print("我是Person构造函数");
    }
//     Person(String name,int age){
//         this.name=name;
//         this.age=age;
//    }
   // Person(this.name,this.age);
    void getInfo(){
       print("${this.name}-----${this.age}");
    }

    void setInfo(int age){
        this.age=age;
    }
}