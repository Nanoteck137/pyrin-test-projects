import { ApiClient } from "./api/client";

console.log("Hello World");

const client = new ApiClient("http://localhost:1337");

async function test() {
  const res = await client.test("321", {
    username: "testuser",
    password: "password",
    confirmPassword: "password",
  });
  console.log(res);

  const s = client.url.test("123");
  console.log(s);
}

test();
