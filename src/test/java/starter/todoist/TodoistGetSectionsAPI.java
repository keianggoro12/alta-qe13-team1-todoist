package starter.todoist;

import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;

public class TodoistGetSectionsAPI {
    public static String GET_ALL_SECTION = Constants.BASE_URL+"/sections/";
    public static String GET_SINGLE_SECTION = Constants.BASE_URL+"/sections/{section_id}";

    @Step("Get all sections")
    public void setGetAllSections(){
    }
    @Step("Get single section")
    public void setGetSingleSection(String section_id){
        SerenityRest.given().headers("Authorization", "Bearer " + Constants.TOKEN_NIA)
                .pathParam("section_id", section_id);
    }
}
