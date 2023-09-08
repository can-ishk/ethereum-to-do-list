pragma solidity ^0.5.0;

contract ToDoList {
    uint public taskCount = 0; // state variable to store the number of tasks
    //scope of the variable belongs to the entire smart contract.
    struct Task {
        uint id;
        string content;
        bool completed;
    }
    event TaskCreated(
        uint id,
        string content,
        bool completed
    );
    event TaskCompleted(
    uint id,
    bool completed
  );
    mapping(uint => Task) public tasks; // basically a hashmap to store the tasks

    constructor() public {
        createTask("Create a new task!");
    }
    //CRUD operations

    function createTask(string memory _content) public{
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        // task created event
        emit TaskCreated(taskCount, _content, false);

    }
    function toggleCompleted(uint _id) public{
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}