package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.module.jsv.JsonSchemaValidator;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistGetSectionsAPI;
import starter.utils.Constants;

import java.io.File;

import static net.serenitybdd.rest.SerenityRest.then;

public class TodoistGetSectionsStepDef {
    @Steps
    TodoistGetSectionsStepDef todoistGetSectionsAPI;

    //scenario get all
    @Given("Get all sections")
    public void getAllSections() {
        todoistGetSectionsAPI.getAllSections();
    }
    @When("Send request get all sections")
    public void sendRequestGetAllSections() {
        SerenityRest.given().header("Authorization","Bearer " + Constants.TOKEN_NIA).when().get(TodoistGetSectionsAPI.GET_ALL_SECTION);
    }
    @Then("Status code should be {int}")
    public void statusCodeShouldBe(int statusCode) {
        then()
                .statusCode(statusCode);
    }
    @And("Validate get section json schema {string}")
    public void validateGetSectionJsonSchema(String json) {
        File jsonSection = new File(Constants.JSON_SCHEMA+json);
        SerenityRest.and().assertThat().body(JsonSchemaValidator.matchesJsonSchema(jsonSection));
    }
}
