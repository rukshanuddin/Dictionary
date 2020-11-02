$(document).on('turbolinks:load', function () {
    $("body").on("click", ".single-project-card, .single-project-list", function () {
        var posted_by = $(this).find('.project-content .posted-by').html();
        var project_heading = $(this).find('.project-content h3').html();
        var project_content = $(this).find('.project-content p').html();
        var interested = $(this).find('.project-content .interested').attr('href');
        $('.modal-header .posted-by').text(posted_by);
        $('.loaded-data h3').text(project_heading);
        $('.loaded-data p').text(project_content);
        $('.loaded-data .interested a').attr('href', interested);
        $('.myModal').modal('show');
    });
});