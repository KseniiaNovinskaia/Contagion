import $ from 'jquery';
import 'select2';

const initSelect2 = () => {



  // $('.select2') = (~ document.querySelectorAll...)
  $('.select2').select2({
    placeholder: "select species",
    allowClear: true
  });
};




export { initSelect2 };
