const request = require('supertest')
const app = require('./index.routes.js')

it('respond with json containing a list of all users', done =>{
    request(app)
    .get('./usuario')
    // .set('Accept', 'application/json')
    // .expect('Content-Type', /json/)
    .expect(200,done)
})
