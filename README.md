[![Build Status](https://travis-ci.org/laurenjrichie/gCamp.svg?branch=master)](https://travis-ci.org/laurenjrichie/gCamp)

# GCamp

[Visit live](https://frozen-wildwood-7613.herokuapp.com/)

This is a project management app modeled after Basecamp and built in Rails. Users can register, sign in, create projects and associated tasks, and manage members.

Features: 
- User, Task, Project, Membership, & FAQ models
- Models have validations & associations (users have many projects through memberships, tasks belong to projects, etc.)
- User authentication & authorization
- Test coverage with capybara and rspec
- Full CRUD functionality for projects, tasks & memberships
- Export tasks to CSV

