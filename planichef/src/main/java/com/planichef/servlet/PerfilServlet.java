package com.planichef.servlet;

import com.planichef.model.Usuario;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("PlaniChefPU");
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        
        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("perfil.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuarioSessao = (Usuario) session.getAttribute("usuario");
        
        if (usuarioSessao == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senhaAtual = request.getParameter("senhaAtual");
        String novaSenha = request.getParameter("novaSenha");
        String[] preferencias = request.getParameterValues("preferencias");
        String[] restricoes = request.getParameterValues("restricoes");

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            
            Usuario usuario = em.find(Usuario.class, usuarioSessao.getId());
            
            if (usuario != null) {
                usuario.setNome(nome);
                usuario.setEmail(email);
                
                // Atualiza senha apenas se a senha atual estiver correta e uma nova senha for fornecida
                if (senhaAtual != null && !senhaAtual.isEmpty() && 
                    novaSenha != null && !novaSenha.isEmpty() && 
                    senhaAtual.equals(usuario.getSenha())) {
                    usuario.setSenha(novaSenha); // TODO: Implementar criptografia
                }
                
                if (preferencias != null) {
                    usuario.setPreferenciasAlimentares(Arrays.asList(preferencias));
                }
                
                if (restricoes != null) {
                    usuario.setRestricoesDieteticas(Arrays.asList(restricoes));
                }

                em.merge(usuario);
                em.getTransaction().commit();
                
                // Atualiza o usuário na sessão
                session.setAttribute("usuario", usuario);
                
                request.setAttribute("sucesso", "Perfil atualizado com sucesso!");
            }
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            request.setAttribute("erro", "Erro ao atualizar perfil: " + e.getMessage());
        } finally {
            em.close();
        }

        request.getRequestDispatcher("perfil.jsp").forward(request, response);
    }
} 