$(document).on('turbolinks:load', function () {
    if ($(".single-project-card").length) {
        if (mode == 1) {
            $(".single-project-card").each(function () {
                $(this).addClass("solid-color-mode");
                $(this).css('background-color', randomColor());
            });
        }
        else {
            $(".single-project-card").each(function () {
                $(this).addClass("border-color-mode");
                $(this).css('border', '5px solid ' + randomColor());
            });
        }
    }


    $('#feed').on('mouseenter', '.single-project-list', function () {
        $(this).css('border-color', randomColor());
    });

    $('#feed').on('mouseleave', '.single-project-list', function () {
        $(this).css('border-color', 'rgba(0, 0 , 0, 0.05)');
    });

});

var colorSet = randomColorSet();
var mode = Math.floor(Math.random() * 2);

function randomColorSet() {
    var colorSet1 = ['#DEE9FC', '#6395F2', '#1259DE', '#0A337F', '#091834'];
    var colorSet2 = ['#FBFDFE', '#3988A7', '#1B57FE', '#5536DD', '#130A39'];
    var colorSet3 = ['#FFFFFF', '#FD7831', '#3C8FB0', '#189FD5', '#0B2E3C'];
    var colorSet4 = ['#FFFFFF', '#439BBE', '#E8267A', '#FDDC65', '#420C23'];
    var colorSet5 = ['#FFFFFF', '#CAE371', '#FE695C', '#469DC0', '#0C3343'];
    var colorSet6 = ['#E1ECF9', '#609CE1', '#236AB9', '#133863', '#091D34'];
    var colorSet7 = ['#FDFEFE', '#72B5CF', '#3884A3', '#1E4757', '#0A2B38'];
    var randomSet = [colorSet1, colorSet2, colorSet3, colorSet4, colorSet5, colorSet6, colorSet7];
    return randomSet[Math.floor(Math.random() * randomSet.length)];
}

function randomColor() {
    var color = colorSet[Math.floor(Math.random() * colorSet.length)];
    return color;
}