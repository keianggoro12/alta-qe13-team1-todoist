package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistGetProjectAPI;
import starter.todoist.TodoistResponses;
import starter.utils.Constants;
import io.restassured.module.jsv.JsonSchemaValidator;
import java.io.File;

import static net.serenitybdd.rest.SerenityRest.then;
import static org.hamcrest.Matchers.equalTo;

public class TodoistGetProjectStepDef {

    @Steps
    TodoistGetProjectAPI todoistGetProjectAPI;

    @Given("Get all project")
    public void getAllProject() {todoistGetProjectAPI.setGetAllProject();
    }

    @When("Send request get all project")
    public void sendRequestGetProject() {
        SerenityRest.given()
          .header("Authorization", "Bearer " + Constants.TOKEN_KEI)
                .when().get(TodoistGetProjectAPI.GET_ALL_PROJECT);
    }
    @When("Send request get single project")
    public void sendRequestSingleProject(){
    SerenityRest.when().get(TodoistGetProjectAPI.GET_SINGLE_PROJECT);
    }

    @Then("Status code should be {int}")
    public void statusCodeShouldBe(int statusCode) {
        then()
                .statusCode(statusCode);
    }

    @And("Validate get project json schema {string}")
    public void validateGetProjectJsonSchema(String json) {
        File jsonProject = new File(Constants.JSON_SCHEMA+json);
        SerenityRest.and().assertThat().body(JsonSchemaValidator.matchesJsonSchema(jsonProject));
    }

    @Given("Get single project with {string}")
    public void getSingleProjectValid(String project_id) {
        todoistGetProjectAPI.setGetSingleProject(project_id);
    }

    @And("Response body should {string}")
    public void responseBodyShould(String response) {
        then().body(equalTo(response));
    }
}
