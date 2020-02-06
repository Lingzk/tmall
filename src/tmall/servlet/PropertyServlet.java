package tmall.servlet;

import tmall.bean.Category;
import tmall.bean.Property;
import tmall.dao.CategoryDAO;
import tmall.util.Page;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author Ling
 * Created on 2020/2/6
 */
@WebServlet("/propertyServlet")
public class PropertyServlet extends BaseBackServlet {
    @Override
    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        Category c = categoryDAO.get(cid);

        String name = request.getParameter("name");
        Property property = new Property();
        System.out.println(name);
        property.setCategory(c);
        property.setName(name);
        propertyDAO.add(property);
        return "@admin_property_list?cid=" + cid;
    }

    @Override
    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id = Integer.parseInt(request.getParameter("id"));
        Property p = propertyDAO.get(id);
        propertyDAO.delete(id);
        return "@admin_property_list?cid=" + p.getCategory().getId();
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id = Integer.parseInt("id");
        Property p = propertyDAO.get(id);
        request.setAttribute("p", p);
        // 服务器端跳转
        return "admin/editProperty.jsp";
    }

    @Override
    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id = Integer.parseInt(request.getParameter("id"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        Category c = categoryDAO.get(cid);
        Property p = new Property();
        p.setId(id);
        p.setName(request.getParameter("name"));
        p.setCategory(c);
        propertyDAO.update(p);
        return "@admin_property_list?cid=" + c.getId();
    }

    @Override
    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        Category c = categoryDAO.get(cid);
        List<Property> ps = propertyDAO.list(cid, page.getStart(), page.getCount());
        int total = propertyDAO.getTotal(cid);
        page.setTotal(total);
        page.setParam("&cid=" + cid);

        request.setAttribute("ps", ps);
        request.setAttribute("page", page);
        // 加入c是用于list页面的回显
        request.setAttribute("c", c);

        return "admin/listProperty.jsp";
    }
}
