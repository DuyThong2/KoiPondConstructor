package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Term;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;
import javax.persistence.NoResultException;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class TermDAO {

    private EntityManager entityManager;

    public TermDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Term> getTemplateTerm() {
        TypedQuery<Term> query = entityManager.createQuery("SELECT t from Term t where t.isTemplate =  true and t.termStatus = true", Term.class);
        return query.getResultList();
    }

    // Search terms by description
    public List<Term> searchByDescription(String description, int page, int size, String sortBy, String sortDirection, Boolean isDisabled) {
        StringBuilder jpql = new StringBuilder("SELECT t FROM Term t WHERE t.description LIKE :description and t.isTemplate =  true");

        // Add the filter for the disabled status if it's provided
        if (isDisabled != null) {
            jpql.append(" AND t.termStatus = :isDisabled");
        }

        jpql.append(" ORDER BY t.").append(sortBy).append(" ").append(sortDirection);

        TypedQuery<Term> query = entityManager.createQuery(jpql.toString(), Term.class);
        query.setParameter("description", "%" + description + "%");

        // Set the isDisabled filter
        if (isDisabled != null) {
            query.setParameter("isDisabled", isDisabled);
        }

        query.setFirstResult(page * size);
        query.setMaxResults(size);
        return query.getResultList();
    }

    public long countByDescription(String description, Boolean isDisabled) {
        StringBuilder jpql = new StringBuilder("SELECT COUNT(t) FROM Term t WHERE t.description LIKE :description and t.isTemplate =  true");

        // Add the filter for the disabled status if it's provided
        if (isDisabled != null) {
            jpql.append(" AND t.isDisabled = :isDisabled");
        }

        TypedQuery<Long> query = entityManager.createQuery(jpql.toString(), Long.class);
        query.setParameter("description", "%" + description + "%");

        if (isDisabled != null) {
            query.setParameter("isDisabled", isDisabled);
        }

        return query.getSingleResult();
    }

    // Find all terms and filter by disabled status
    public List<Term> findAllTerms(int page, int size, String sortBy, String sortDirection, Boolean termStatus) {
        StringBuilder jpql = new StringBuilder("SELECT t FROM Term t");

        // Add the filter for the term status if it's provided
        if (termStatus != null) {
            jpql.append(" WHERE t.termStatus = :termStatus and t.isTemplate = true");
        }

        jpql.append(" ORDER BY t.").append(sortBy).append(" ").append(sortDirection);

        TypedQuery<Term> query = entityManager.createQuery(jpql.toString(), Term.class);

        if (termStatus != null) {
            query.setParameter("termStatus", termStatus);
        }

        query.setFirstResult(page * size);
        query.setMaxResults(size);
        return query.getResultList();
    }

    public long countAllTerms(Boolean isDisabled) {
        StringBuilder jpql = new StringBuilder("SELECT COUNT(t) FROM Term t WHERE t.isTemplate = true");

        // Add the filter for the disabled status if it's provided
        if (isDisabled != null) {
            jpql.append(" AND t.termStatus = :isDisabled");
        }

        TypedQuery<Long> query = entityManager.createQuery(jpql.toString(), Long.class);

        if (isDisabled != null) {
            query.setParameter("isDisabled", isDisabled);
        }

        return query.getSingleResult();
    }

    public Term findById(int termId) {
        try {
            return entityManager.find(Term.class, termId);
        } catch (NoResultException e) {
            return null;
        }

    }

    // Update term
    @Transactional
    public Term save(Term term) {
        return entityManager.merge(term);
    }

}
