"use strict";
exports.__esModule = true;
function isAdult(user) {
    return user.age >= 18;
}
var justine = {
    name: 'Justine',
    age: 23
};
console.log(isAdult(justine));
console.log("New change");
