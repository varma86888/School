// $( document ).ready(function() {
$( document ).on("turbolinks:load", function() { 
    $('#branches_id').hide();
    $('#standards_id').hide();
    $('#students_id').hide();
    $('#student_info').hide();
    $('#teachers_id').hide();
    $('#schools').change(function() {
        var id = $(this).val();
            $('#standards_id').hide();
            $('#students_id').hide();
            $('#teachers_id').hide();
            $('#student_info').hide();
        get_branches(id);
    });
    $('#branches').change(function() {
        var branch_id = $("#branches").val();
             $('#students_id').hide();
             $('#teachers_id').hide();
        get_standards(branch_id);
    })
    $('#standards').change(function() {
        var standard_id = $("#standards").val();
        $('#students_id').hide();
        get_teachers(standard_id);
    })
    $('#teachers').change(function() {
        var teacher_id = $("#teachers").val();
        get_students(teacher_id);
    })
    $('#students').change(function() {
            $('#student_info').show();
            get_student_details($(this).val());
        })
});
function get_branches(id){
    Rails.ajax({
        url: "/student_infos/"+ id +"/get_branches",
        type: "get",
        success: function(data) {
            var select = $('#branches');
            select.find('option').remove();
            $('<option>').val(" ").text(" ").appendTo(select);
            $.each(data, function(key,value){
                $('<option>').val(value.id).text(value.location).appendTo(select);
            });
            $('#branches_id').show();
        }
    })
};
function get_standards(id){
    var formdata = new FormData();
    formdata.append("school_id", $("#schools").val());
    formdata.append("branch_id", id);
    Rails.ajax({
        url: "/student_infos/get_standards",
        type: "post",
        data: formdata, 
        datatype: "json",
        contentType: "application/json",
        success: function(data) {
            var select = $('#standards');
            select.find('option').remove();
            $('<option>').val(" ").text(" ").appendTo(select);
            $.each(data, function(key,value){
                $('<option>').val(value.id).text(value.name).appendTo(select);
            });
            $('#standards_id').show();
        }
    })
};
function get_students(id){
    var formdata = new FormData();
    formdata.append("school_id", $("#schools").val());
    formdata.append("branch_id", $("#branches").val());
    formdata.append("standard_id", $("#standards").val());
    formdata.append("teacher_id", id);
    Rails.ajax({
        url: "/student_infos/get_students",
        type: "post",
        data: formdata, 
        datatype: "json",
        contentType: "application/json",
        success: function(data) {
            var select = $('#students');
            select.find('option').remove();
            $('<option>').val(" ").text(" ").appendTo(select);
            $.each(data, function(key,value){
                $('<option>').val(value.id).text(value.name).appendTo(select);
            });
            $('#students_id').show();     
        }
    })
};
function get_teachers(id){
    var formdata = new FormData();
    formdata.append("school_id", $("#schools").val());
    formdata.append("branch_id", $("#branches").val());
    formdata.append("standard_id", id);
    Rails.ajax({
        url: "/student_infos/get_teachers",
        type: "post",
        data: formdata, 
        datatype: "json",
        contentType: "application/json",
        success: function(data) {
            var select = $('#teachers');
            select.find('option').remove();
            $('<option>').val(" ").text(" ").appendTo(select);
            $.each(data, function(key,value){
                $('<option>').val(value.id).text(value.name).appendTo(select);
            });
            $('#teachers_id').show();     
        }
    })
};
function get_student_details(id){
    Rails.ajax({
        url: "/students/"+id,
        type: "get",
        success: function(data) {
            $(".student_name").text(data.name);
            $(".student_gender").text(data.gender);
            $(".student_age").text(data.age);
        }
    })
}