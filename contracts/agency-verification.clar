;; Agency Verification Contract
;; Manages recruitment agency registration and verification

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_AGENCY_EXISTS (err u101))
(define-constant ERR_AGENCY_NOT_FOUND (err u102))
(define-constant ERR_AGENCY_NOT_VERIFIED (err u103))

;; Data structures
(define-map agencies
  { agency-id: uint }
  {
    name: (string-ascii 100),
    owner: principal,
    verified: bool,
    registration-date: uint
  }
)

(define-data-var next-agency-id uint u1)

;; Register a new recruitment agency
(define-public (register-agency (name (string-ascii 100)))
  (let ((agency-id (var-get next-agency-id)))
    (asserts! (is-none (map-get? agencies { agency-id: agency-id })) ERR_AGENCY_EXISTS)
    (map-set agencies
      { agency-id: agency-id }
      {
        name: name,
        owner: tx-sender,
        verified: false,
        registration-date: block-height
      }
    )
    (var-set next-agency-id (+ agency-id u1))
    (ok agency-id)
  )
)

;; Verify an agency (only contract owner)
(define-public (verify-agency (agency-id uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? agencies { agency-id: agency-id })
      agency-data (begin
        (map-set agencies
          { agency-id: agency-id }
          (merge agency-data { verified: true })
        )
        (ok true)
      )
      ERR_AGENCY_NOT_FOUND
    )
  )
)

;; Check if agency is verified
(define-read-only (is-agency-verified (agency-id uint))
  (match (map-get? agencies { agency-id: agency-id })
    agency-data (ok (get verified agency-data))
    ERR_AGENCY_NOT_FOUND
  )
)

;; Get agency details
(define-read-only (get-agency (agency-id uint))
  (map-get? agencies { agency-id: agency-id })
)
