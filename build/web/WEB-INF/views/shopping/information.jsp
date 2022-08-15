<%-- 
    Document   : index
    Created on : Mar 20, 2022, 7:27:08 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>


<form action="success.do" class="mb-5">
  <div class="mb-3 mt-3">
    <label for="gmail" class="form-label">Email:</label>
    <input type="email" class="form-control" id="gmail" placeholder="Enter email" name="gmail" value="${gmail}">
  </div>
  <div class="mb-3">
    <label for="pwd" class="form-label">Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
  </div>
  <div class="form-check mb-3">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" name="remember"> Remember me
    </label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  <div style="color: red; font-style: italic;">
       ${error}
  </div>
</form>