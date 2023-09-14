package examples.users;


import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("exampleGetRequest").relativeTo(getClass());
    }
    @Karate.Test
    Karate testWithTags(){
        return Karate.run("examplePostRequest").tags("@postExample2").relativeTo(getClass());
    }

}
