module.exports = function (grunt) {

    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-open');

    grunt.initConfig({
        connect:
        {
            server:
            {
                options:
                {
                    port: 8080,
                    base: './bin',
                    keepalive: true,
                    hostname: '*'
                }
            }
        },

        open:
        {
            dev: {
                path: 'http://localhost:8080/index.html'
            }
        }
    });

    grunt.registerTask('default', ['open', 'connect']);
}