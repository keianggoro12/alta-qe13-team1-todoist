package starter.todoist;

import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;

public class TodoistGetSectionAPI {

//    public static String GET_ALL_SECTION = Constants.BASE_URL+"/sections/";
    public static String GET_SECTION = Constants.BASE_URL+"/sections?project_id={project_id}";
    public static String GET_SECTION2 = Constants.BASE_URL+"/sections/{project_id}";


    @Step("Get section")
    public void setGetSection(String project_id){
        SerenityRest.given().headers("Authorization", "Bearer " + Constants.TOKEN_NIA)
                .pathParam("project_id", project_id);
    }
}
