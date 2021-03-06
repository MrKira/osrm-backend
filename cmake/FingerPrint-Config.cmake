set(OLDFILE ${OUTPUT_DIR}/util/fingerprint_impl.hpp)
set(NEWFILE ${OLDFILE}.tmp)
set(INFILE ${SOURCE_DIR}/util/fingerprint_impl.hpp.in)
file(MD5 ${SOURCE_DIR}/prepare.cpp MD5PREPARE)
file(MD5 ${SOURCE_DIR}/data_structures/static_rtree.hpp MD5RTREE)
file(MD5 ${SOURCE_DIR}/util/graph_loader.hpp MD5GRAPH)
file(MD5 ${SOURCE_DIR}/server/data_structures/internal_datafacade.hpp MD5OBJECTS)

CONFIGURE_FILE(${INFILE} ${NEWFILE})

file(MD5 ${NEWFILE} MD5NEW)

if (EXISTS ${OLDFILE})
    file(MD5 ${OLDFILE} MD5OLD)
    if(NOT ${MD5NEW} STREQUAL ${MD5OLD})
        file(REMOVE_RECURSE ${OLDFILE})
        file(RENAME ${NEWFILE} ${OLDFILE})
    else()
        file(REMOVE_RECURSE ${NEWFILE})
        message(STATUS "Fingerprint unchanged, not regenerating")
    endif()
else()
    file(RENAME ${NEWFILE} ${OLDFILE})
endif()
