package starter.stepdef;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.todoist.TodoistDeleteProjectAPI;

public class TodoistDeleteProjectStepDef {

    @Steps
    TodoistDeleteProjectAPI todoistDeleteProjectAPI;
    @Given("Delete project with {string}")
    public void deleteProjectWith(String project_id) {
      todoistDeleteProjectAPI.deleteProject(project_id);
    }
    @When("Send request delete project")
    public void sendRequestDeleteProject() {
        SerenityRest.when().delete(TodoistDeleteProjectAPI.DELETE_PROJECT);
    }

}
