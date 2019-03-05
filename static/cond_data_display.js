const s_table = $('#s_table');
const table_s_data = s_table.data('study');

var study_table = new Tabulator("#s_table", {
    data:table_s_data, //set initial table data
    columns:[
        {title:"NCT Number", field:"nct_number"},
        {title:"Status", field:"status"},
        {title:"Study Type", field:"study_type"},
        {title:"Study Title", field:"title"},
        {title:"Study Start Date", field:"start_date"},
        {title:"Gender", field:"gender"},
        {title:"Enrollment", field:"enrollment"},
    ]
});


const a_table = $('#a_table');
const table_a_data = a_table.data('ages');

var ages_table = new Tabulator("#a_table", {
    data:table_a_data, //set initial table data
    columns:[
        {title:"Age Range", field:"age_range"},
        {title:"Age Detail", field:"age_detail_child"},
        {title:"Age Detail", field:"age_detail_adult"},
        {title:"Age Detail", field:"age_detail_older"},
    ]
});


const p_table = $('#p_table');
const table_p_data = p_table.data('phases');

var phases_table = new Tabulator("#p_table", {
    data:table_p_data, //set initial table data
    columns:[
          {title:"Phase Detail", field:"phase_detail"}
    ]
});


const i_table = $('#i_table');
const table_i_data = i_table.data('inters');

var inters_table = new Tabulator("#i_table", {
    data:table_i_data, //set initial table data
    columns:[
          {title:"Intervention Detail", field:"inter_detail"}
    ]
});


const c_table = $('#c_table');
const table_c_data = c_table.data('conds');

var conds_table = new Tabulator("#c_table", {
    data:table_c_data, //set initial table data
    columns:[
          {title:"Condition Detail", field:"cond_detail"}
    ]
});


const si_table = $('#si_table');
const table_si_data = si_table.data('sites');

var sites_table = new Tabulator("#si_table", {
    data:table_si_data, //set initial table data
    columns:[
          {title:"Site Name", field:"site_name"},
          {title:"Site City", field:"site_city"},
          {title:"Site State", field:"site_state"},
          {title:"Site Country", field:"site_country"} 
    ],
    movableRows: true,
    selectable:true,
    pagination:"local", //enable local pagination.
    paginationSize:5,
    paginationButtonCount:3
});



