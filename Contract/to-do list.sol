// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract todoList{
    struct Task {
    uint256 id;
    address creator;
    string content;
    bool done;
    uint256 createdAt;
}

Task [] private tasks;
event Taskcreated (uint256 indexed id, address indexed creator, string content);
event Tasktoggled (uint256 indexed id, bool done);


function addTask(string calldata content) external {
    require(bytes(content).length > 0, "Empty content");
    uint256 id = tasks.length;
    tasks.push(Task({
        id: id,
        creator: msg.sender,
        content: content,
        done: false,
        createdAt: block.timestamp
    }));
    emit Taskcreated(id, msg.sender, content);
}
function toggleDone(uint256 id) external {
    require(id < tasks.length, "Invalid id");
    require(tasks[id].creator == msg.sender, "Only creator can toggle");
    tasks[id].done = !tasks[id].done;
    emit Tasktoggled(id, tasks[id].done);
}
function getTask(uint256 id) external view returns (Task memory) {
    require(id < tasks.length, "Invalid id");
    return tasks[id];
}
function getAllTasks() external view returns (Task[] memory) {
    return tasks;
}


}
