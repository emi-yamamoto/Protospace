$(window).on('load', function(){
    $('.js-preview-image').each(function() {
        var preview = $(this);
        var input = preview.find('input[type=file]');
        input.change(function(){
            if (!this.files.length) {
                return;
            }
            var file = this.files[0]
            fr = new FileReader();
            fr.readAsDataURL(file);
            fr.onload = function() {
                preview.css({
                    'background-image': 'url(' + fr.result + ')',
                    'background-size': 'contain'
                });
            };
        });
    });
});
