-module(toDoList).
-export([main/0]).

main() ->
    runList().
    
    %printList(list).

%by creating a record, I can link the task to whether it is completed or not
-record(task, {description = "", completed = false}).

%this function asks the user for their task and adds it to the list
%it also by default sets the task to NOT completed
addTask() ->
    TaskList = [],
    io:format("Enter a task: "),
    Des = io:get_line(""), %gets user input
    Task = #task{description = Des, completed = false},
    [Task | TaskList].
    % NewList = [Task | TaskList],  
    % NewList.
 
 %this function updates the completion of the task to true
completedTask(Task) ->
    Task#task{completed = true}.

%this function will loop until the user is done adding/ completing tasks
runList() ->
    io:format("Ready to start your To Do List for today!"),
    io:format("Would you like to add a task, mark a task as completed, or end program? ('add', 'complete', or 'end'): "),
    Input = io:get_line(""),
    case string: strip(Input) of 
        "add" ->
            addTask(),
            runList(); %example of recursion 
        "complete" ->
            completedTask(Task),
            runList();
        "end" ->
            io:format("Great job today!");
    end. 



