import React, { useEffect, useState } from "react";

function Hello({ setStoredToken }) {
  const [name, setName] = useState("");
  const [id, setId] = useState("");
  const [role, setRole] = useState("");
  const [profiles, setProfiles] = useState([]);

  const [profName, setProfName] = useState("");
  const [doc, setDoc] = useState("");
  const [job, setJob] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    fetch("/profiles", {
      method: "POST",
      headers: {
        Accepts: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${localStorage.token}`,
      },
      body: JSON.stringify({
        user_id: id,
        name: profName,
        doctor: doc,
        job: job,
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        setProfName("");
        setDoc("");
        setJob("");
      });
  };
  useEffect(() => {
    fetch("/api/v1/profile ", {
      method: "GET",
      headers: {
        Accepts: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${localStorage.token}`,
      },
    })
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        setName(data.user.username);
        setId(data.user.id);
        setRole(data.user.role);
      });
  }, []);

  useEffect(() => {
    fetch("/profiles", {
      method: "GET",
      headers: {
        Accepts: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${localStorage.token}`,
      },
    })
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        setProfiles(data);
      });
  }, []);

  const handleFileUpload = (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append("upload[file]", e.target.file.files[0]);
    formData.append("upload[title]", e.target.title.value);
    console.log(formData);
    submitData(formData);
  };

  const submitData = (data) => {
    fetch("/uploads", {
      method: "POST",
      body: data,
    })
      .then((response) => response.json())
      .then((data) => console.log(data));
  };

  return (
    <>
      {role === "admin" && !profiles.approved ? (
        <>
          <h1>Admin</h1>
          <ul>
            {profiles.map((profile) => (
              <li key={profile.id}>
                <h2>{profile.name}</h2>
              </li>
            ))}
          </ul>
        </>
      ) : (
        <h1>Not admin</h1>
      )}
      <h1>Hello {name} Create your profile</h1>
      <form>
        <input type="text" onChange={(e) => setProfName(e.target.value)} />

        <input type="text" onChange={(e) => setDoc(e.target.value)} />

        <input type="text" onChange={(e) => setJob(e.target.value)} />
        <button type="submit" onClick={handleSubmit}>
          Submit
        </button>
      </form>

      <form onSubmit={handleFileUpload}>
        <input type="file" name="file" />
        <input type="text" name="title" />
        <button type="submit">Submit</button>
      </form>

      <div>
        <button
          onClick={() => {
            localStorage.setItem("token", "");
            setStoredToken("");
          }}
        >
          Log out
        </button>
      </div>
    </>
  );
}

export default Hello;
