const run = async () => {
    const fastify = require("fastify");
    const serverPort = process.env.SERVER_PORT || 8000;
    const server = fastify({
        disableRequestLogging: true
    });
    // DEFAULT: reply on root request
    server.get("/", async (request, reply) => {
        return {
            status: "online",
            app: "<<APPLICATION>>",
            pid: process.pid
        };
    });
    // ELASTIC BEANSTALK SUBSTITUTE: health check path
    server.get("/<<HEALTH-CHECK-PATH>>/", async (request, reply) => {
        return {
            status: "online",
            app: "<<APPLICATION>>",
            pid: process.pid
        };
    });
    // the Application Load Balancer will route requests based on a path
    // segment, for which we use the application's name
    // ELASTIC BEANSTALK SUBSTITUTE: application name
    server.get("/<<APPLICATION>>/", async (request, reply) => {
        return {
            status: "online",
            app: "<<APPLICATION>>",
            pid: process.pid,
            env: process.env
        };
    });
    await server.listen(serverPort, "0.0.0.0");
    console.log(`Server listening on 0.0.0.0:${serverPort}`);
};
run();
