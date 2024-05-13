
<script>
    var loadFile = function(event) {
        var image = document.getElementById('show_image');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
 </script>

<script src="{{ asset('admin/dist/js/scripts.js') }}"></script>
<script src="{{ asset('admin/dist/js/custom.js') }}"></script>
