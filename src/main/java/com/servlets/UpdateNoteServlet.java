package com.servlets;

import java.io.IOException;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateNoteServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			Note note = session.get(Note.class, noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			tx.commit();
			session.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
