var lectures = [
    {
        name: "정보보호개론",
        room: "26312",
        lectureTimes: [
            {
                day: 0,
                start: { hour: 9, minute: 0 },
                finish: { hour: 10, minute: 15 }
            },
            {
                day: 2,
                start: { hour: 10, minute: 30 },
                finish: { hour: 11, minute: 45 }
            }
        ],
        color: "#ea80fc",
        professor: "최형기"
    },
    {
        name: "알고리즘개론",
        room: "26310",
        lectureTimes: [
            {
                day: 3,
                start: { hour: 9, minute: 0 },
                finish: { hour: 10, minute: 15 }
            },
            {
                day: 1,
                start: { hour: 10, minute: 30 },
                finish: { hour: 11, minute: 45 }
            }
        ],
        color: "#ffe082",
        professor: "조대호"
    }
];
function getRandomColor() {
    var letters = "0123456789ABCDEF";
    var color = "#";
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
function buildTimeTable() {
    var table = document.getElementById("time-table");
    function buildForm() {
        var th = document.createElement("tr");
        for (var _i = 0, _a = ["", "Mon", "Tue", "Wed", "Thur", "Fri"]; _i < _a.length; _i++) {
            var day = _a[_i];
            var timeLabelNode = document.createElement("td");
            timeLabelNode.innerText = day;
            th.appendChild(timeLabelNode);
        }
        table.appendChild(th);
        for (var i = 0; i < 14; i++) {
            // 시간, column
            var tr = document.createElement("tr");
            var timeLabelNode = document.createElement("td");
            timeLabelNode.innerText = "" + (((8 + i) % 12) + 1);
            tr.appendChild(timeLabelNode);
            for (var j = 0; j < 5; j++) {
                // 요일, row
                var node = document.createElement("td");
                node.id = "cell-" + i + "-" + j;
                tr.appendChild(node);
            }
            table.appendChild(tr);
        }
    }
    function fillUpTable() {
        for (var _i = 0, lectures_1 = lectures; _i < lectures_1.length; _i++) {
            var lecture = lectures_1[_i];
            if (!lecture.color)
                lecture.color = getRandomColor();
            for (var _a = 0, _b = lecture.lectureTimes; _a < _b.length; _a++) {
                var lectureTime = _b[_a];
                var col = lectureTime.start.hour - 9;
                var row = lectureTime.day;
                var container = document.getElementById("cell-" + col + "-" + row);
                var ele = document.createElement("div");
                var heightRatio = Math.round(((lectureTime.finish.hour * 60 +
                    lectureTime.finish.minute -
                    lectureTime.start.hour * 60 -
                    lectureTime.start.minute) *
                    100) /
                    60);
                console.log(heightRatio);
                ele.classList.add("lecture-cell");
                ele.style.height = heightRatio + "%";
                ele.style.backgroundColor = lecture.color;
                ele.style.top = Math.round((lectureTime.start.minute * 100) / 60) + "%";
                ele.innerText =
                    lecture.name + "\n" + lecture.room +
                        (lecture.professor ? "\n" + lecture.professor : "");
                container.appendChild(ele);
            }
        }
    }
    buildForm();
    fillUpTable();
}
buildTimeTable();
