<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="permission_form_content">

	<div class="widget-body">

		<div class="well">

			
			<h3>Available classes</h3>
			
			<p>Use a single or combination of the available classes for toggling content across viewport breakpoints.</p>
			
			<div class="table-responsive">
				
				<table class="table table-bordered table-striped responsive-utilities">
				        <thead>
				          <tr>
				            <th></th>
				            <th>
				              Extra small devices
				              <small>Phones (&lt;768px)</small>
				            </th>
				            <th>
				              Small devices
				              <small>Tablets (≥768px)</small>
				            </th>
				            <th>
				              Medium devices
				              <small>Desktops (≥992px)</small>
				            </th>
				            <th>
				              Large devices
				              <small>Desktops (≥1200px)</small>
				            </th>
				          </tr>
				        </thead>
				        <tbody>
				          <tr>
				            <th><code>.visible-xs</code></th>
				            <td class="is-visible">Visible</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-hidden">Hidden</td>
				          </tr>
				          <tr>
				            <th><code>.visible-sm</code></th>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-hidden">Hidden</td>
				          </tr>
				          <tr>
				            <th><code>.visible-md</code></th>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-hidden">Hidden</td>
				          </tr>
				          <tr>
				            <th><code>.visible-lg</code></th>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-visible">Visible</td>
				          </tr>
				        </tbody>
				        <tbody>
				          <tr>
				            <th><code>.hidden-xs</code></th>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-visible">Visible</td>
				          </tr>
				          <tr>
				            <th><code>.hidden-sm</code></th>
				            <td class="is-visible">Visible</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-visible">Visible</td>
				          </tr>
				          <tr>
				            <th><code>.hidden-md</code></th>
				            <td class="is-visible">Visible</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-hidden">Hidden</td>
				            <td class="is-visible">Visible</td>
				          </tr>
				          <tr>
				            <th><code>.hidden-lg</code></th>
				            <td class="is-visible">Visible</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-visible">Visible</td>
				            <td class="is-hidden">Hidden</td>
				          </tr>
				        </tbody>
				      </table>
				
			</div>
			
		</div>


	</div>
			
</div>
<!-- end widget -->
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>