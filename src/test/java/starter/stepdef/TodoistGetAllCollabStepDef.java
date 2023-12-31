package starter.stepdef;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistGetAllCollabAPI;

public class TodoistGetAllCollabStepDef {
    @Steps
    TodoistGetAllCollabAPI todoistGetAllCollabAPI;

    @Given("Get all collaborators with {string}")
    public void getAllCollaboratorsWith(String project_id) {
        todoistGetAllCollabAPI.setGetSingleProject(project_id);
    }

    @When("Send request get all collaborators")
    public void sendRequestGetAllCollaborators() {
        SerenityRest.when().get(TodoistGetAllCollabAPI.GET_ALL_COLLABORATORS);
    }
}
